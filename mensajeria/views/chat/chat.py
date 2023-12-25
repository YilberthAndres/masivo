from django.db import connection
from rest_framework.generics import CreateAPIView, GenericAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import (
    Destinatarios,
    Mensajeria,
    Personas,
)
from django.utils import timezone
from django.db.models.functions import TruncDate
from django.db.models import Count, Case, When, Value, CharField
from datetime import datetime, timedelta
import os
from ..base import send_message_api, capture_first_page_from_s3
import uuid
from masivo.utils import agregar_tarea_dinamicamente
from django_celery_beat.models import PeriodicTask
from django.core.files.storage import get_storage_class

media_storage = get_storage_class()()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


class MenssageLeft(GenericAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            filter_chat = request.GET["filter"]

            if filter_chat != "":
                filters = " (CONCAT(p.nombre, ' ', p.segundonombre, ' ', p.apellido) LIKE %s OR p.telefonowhatsapp LIKE %s)"
                filters_values = ["%" + filter + "%", "%" + filter + "%"]
            else:
                get_status = request.GET["list"]
                filters = "  c.estado_id = %s "
                filters_values = get_status

            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    SELECT
                        subq.recipiente_id,
                        subq.type_message,
                        subq.texto as text_message,
                        subq.timestamp_date,
                        subq.timestamp_hour,
                        subq.name_user,
                        subq.last_name_user,
                        subq.id_message_status,
                        subq.message_status
                    FROM (
                        SELECT
                            m.recipiente_id,
                            m.mime_type as type_message,
                            m.texto AS texto,
                            DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%Y-%%m-%%d') AS timestamp_date,
                            DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%H:%%i') AS timestamp_hour,
                            CONCAT(UPPER(LEFT(p.nombre, 1)), LCASE(SUBSTRING(p.nombre, 2))) AS name_user,
                            CONCAT(UPPER(LEFT(p.apellido, 1)), LCASE(SUBSTRING(p.apellido, 2))) AS last_name_user,
                            ROW_NUMBER() OVER (PARTITION BY m.recipiente_id ORDER BY m.timestamp_w DESC) AS row_num,
                            ma.id as id_message_status, 
                            CONCAT(UPPER(LEFT(ma.nombre, 1)), LCASE(SUBSTRING(ma.nombre, 2))) as message_status
                        FROM mensajeria m
                        INNER JOIN conversaciones c ON (m.conversacion_id = c.id)
                        INNER JOIN destinatarios d ON (c.destinatario_id = d.id)
                        INNER JOIN personas p ON (d.persona_id = p.id)
                        LEFT JOIN maestras ma on (m.estado_id = ma.id)
                        WHERE """
                    + filters
                    + """
                        AND DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%Y-%%m-%%d') >= CURDATE() - INTERVAL 300 DAY
                    ) AS subq
                    WHERE subq.row_num = 1;
                """,
                    filters_values,
                )

                rows = cursor.fetchall()

            chats = []
            for row in rows:
                recipiente_id = row[0]
                type_message = row[1]
                texto = row[2]
                timestamp_date = row[3]
                timestamp_hour = row[4]
                name_user = row[5]
                last_name_user = row[6]
                id_message_status = row[7]
                message_status = row[8]

                chat = {
                    "recipiente_id": recipiente_id,
                    "type_message": type_message,
                    "texto": texto,
                    "timestamp_date": timestamp_date,
                    "timestamp_hour": timestamp_hour,
                    "name_user": name_user,
                    "last_name_user": last_name_user,
                    "id_message_status": id_message_status,
                    "message_status": message_status,
                }
                chats.append(chat)

            data = {"chats": chats}

            self.status = 200
            self.data = data
            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_404_NOT_FOUND
            self.error = str(e.args)
            return Response(self.response_obj)


class MenssageFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            telefonowhatsapp = request.GET.get("user_phone", "")

            persona = (
                Personas.objects.filter(telefonowhatsapp=telefonowhatsapp)
                .only("id")
                .exists()
            )

            if persona:
                mensajes = (
                    Mensajeria.objects.filter(
                        recipiente_id=telefonowhatsapp,
                        created_at__gte=timezone.now() - timezone.timedelta(weeks=200),
                    )
                    .annotate(
                        estado_annotation=Case(
                            When(created_by_id__isnull=True, then=Value("recibido")),
                            default=Value("enviado"),
                            output_field=CharField(),
                        ),
                        fecha=TruncDate("created_at"),
                    )
                    .select_related("multimedia_id")
                    .values(
                        "estado_annotation",
                        "recipiente_id",
                        "fecha",
                        "estado_id",
                        "timestamp_w",
                        "texto",
                        "mensaje_id",
                        "mime_type",
                        "link",
                        "filename",
                        "voice",
                        "id",
                        "multimedia_id__file",
                        "multimedia_id__nombre",
                        "multimedia_id__tipo",
                        "multimedia_id__preview",
                        "multimedia_id__page_count",
                        "multimedia_id__weight_file"
                    )
                    .annotate(cantidad_registros=Count("id"))
                    .order_by("fecha", "created_at")
                )

                resultados = {}
                for mensaje in mensajes:
                    timestamp = float(mensaje["timestamp_w"])
                    fecha_hora = datetime.fromtimestamp(timestamp)
                    fecha = fecha_hora.strftime("%Y/%m/%d")

                    hora = fecha_hora.strftime("%H")
                    minutos = fecha_hora.strftime("%M")
                    hora_completa = hora + ":" + minutos

                    if fecha not in resultados:
                        resultados[fecha] = []

                    resultados[fecha].append(
                        {
                            "estado": mensaje["estado_annotation"],
                            "recipiente_id": mensaje["recipiente_id"],
                            "fecha": fecha,
                            "id": mensaje["id"],
                            "estado_id": mensaje["estado_id"],
                            "texto": mensaje["texto"],
                            "mensaje_id": mensaje["mensaje_id"],
                            "mime_type": mensaje["mime_type"],
                            "dir": mensaje["link"],
                            "filename": mensaje["filename"],
                            "voice": mensaje["voice"],
                            "hora": hora_completa,
                            "multimedia": {
                                "url": media_storage.url(mensaje["multimedia_id__file"])
                                if mensaje["multimedia_id__file"] != None
                                else None,
                                "name": mensaje["multimedia_id__nombre"],
                                "preview": mensaje["multimedia_id__preview"],
                                "pages": mensaje["multimedia_id__page_count"],
                                "file_weight": mensaje["multimedia_id__weight_file"]
                            },
                        }
                    )
                now = timezone.now()
                limite_tiempo = now - timedelta(hours=24)

                registros = Mensajeria.objects.filter(
                    recipiente_id=telefonowhatsapp, created_at__gte=limite_tiempo
                )

                cantidad_registros = True
                if registros.count() <= 0:
                    cantidad_registros = False

                response_data = {
                    "resultados": resultados,
                    "chat_view": cantidad_registros,
                }

                response_data = {
                    "status": status.HTTP_200_OK,
                    "data": response_data,
                    "state": True,
                }
                return Response(response_data)
            else:
                self.status = status.HTTP_404_NOT_FOUND
                self.error = f"{telefonowhatsapp} invalid"
                return Response(self.response_obj)
        except Exception as e:
            response_data = {
                "status": status.HTTP_404_NOT_FOUND,
                "message": str(e.args),
                "state": False,
            }
            return Response(response_data)


class MenssageSend(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data = request.data[0]
            recipient = data.get("recipient", None)
            file_id = data.get("file_id", "")
            type_message = data.get("type")
            message = data.get("message", "")

            user = request.user
            recipient_model = Destinatarios.objects.get(
                persona__telefonowhatsapp=recipient
            )
            recipient_id = recipient_model.id

            if recipient_model:
                data_send = {
                    "recipient_id": recipient_id,
                    "recipient_w": recipient,
                    "message": message,
                    "type_message": type_message,
                    "file_id": file_id,
                    "user": user,
                    "user_id": user.id,
                }

                data_message = send_message_api(data_send)

                if data_message["estado_envio"]:
                    self.data = {
                        "status": status.HTTP_200_OK,
                        "data": data_message,
                        "message": "Exitoso.",
                    }
                else:
                    self.status = status.HTTP_400_BAD_REQUEST
                    self.error = data_message["error"]

                return Response(self.response_obj)
            else:
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "Error destinatario no valido"

                return Response(self.response_obj)

        except Exception as e:
            response_data = {
                "status": status.HTTP_404_NOT_FOUND,
                "message": e.args,
                "state": False,
            }
            return Response(response_data)


class ProgrammedSend(GenericAPIView, ResponseMixin):
    def post(self, request, *args, **kwargs):
        try:
            data = request.data
            asunto = data.get("asunto", "")
            fecha = data.get("fecha", "")
            hora = data.get("hora", "")
            adjunto = data.get("adjunto", "")
            to = data.get("to", "")
            description = data.get("descripcion", "")

            if to == "" or fecha == [] or hora == "":
                self.error = "Datos faltantes"
                self.status = status.HTTP_400_BAD_REQUEST
                return Response(self.response_obj)

            fecha_terminacion = None
            length = len(fecha)

            fecha_ejecucion = datetime.strptime(fecha[0] + " " + hora, "%Y-%m-%d %H:%M")

            if length == 2:
                fecha_terminacion = datetime.strptime(
                    fecha[1] + " " + hora, "%Y-%m-%d %H:%M"
                )

                if fecha_terminacion < fecha_ejecucion:
                    self.error = (
                        "Fecha de terminacion no puede ser menor a la fecha de inicio"
                    )
                    self.status = status.HTTP_400_BAD_REQUEST
                    return Response(self.response_obj)

            elif length > 2:
                fecha_terminacion = [
                    datetime.strptime(i + " " + hora, "%Y-%m-%d %H:%M") for i in fecha
                ]

            user = request.user

            recipient_id = Destinatarios.objects.get(persona__telefonowhatsapp=to).pk

            if not recipient_id:
                self.error = "Numero no existe en nuestra base de datos"
                self.status = status.HTTP_400_BAD_REQUEST
                return Response(self.response_obj)

            data_send = {
                "recipient_id": recipient_id,
                "recipient_w": to,
                "message": asunto,
                "file_id": adjunto,
                "type_message": "text",
                "user_id": user.id,
            }

            tarea = agregar_tarea_dinamicamente(
                nombre_tarea=str(uuid.uuid4()),
                fecha_ejecucion=fecha_ejecucion,
                send_to=data_send,
                fecha_terminacion=fecha_terminacion,
                description=description,
            )

            if not tarea["valid"]:
                self.error = tarea["error"]
                self.status = status.HTTP_400_BAD_REQUEST
                return Response(self.response_obj)

            self.data = {
                "tarea": tarea["id"],
                "nombre": tarea["name"],
                "message": "Fue creada exitosamente",
            }

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)


class GetTaskProgrammed(GenericAPIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        try:
            data = (
                PeriodicTask.objects.select_related("crontab")
                .values(
                    "name",
                    "id",
                    "crontab__day_of_month",
                    "crontab__day_of_week",
                    "crontab__hour",
                    "crontab__minute",
                    "crontab__month_of_year",
                    "description",
                )
                .all()
            )

            data_body = []

            now = datetime.now()

            for i in data:
                fecha_inicio = datetime(
                    now.year,
                    int(i["crontab__month_of_year"]),
                    int(i["crontab__day_of_month"][:2]),
                    int(i["crontab__hour"]),
                    int(i["crontab__minute"]),
                )
                fecha_final = datetime(
                    now.year,
                    int(i["crontab__month_of_year"]),
                    int(i["crontab__day_of_month"][-2:]),
                    int(i["crontab__hour"]),
                    int(i["crontab__minute"]),
                )

                body = {
                    "id": i["id"],
                    "name": i["name"],
                    "descripcion": i["description"],
                    "fecha_inicio": fecha_inicio,
                    "fecha_final": fecha_final,
                    "activo": fecha_inicio < fecha_final and fecha_final > now,
                }
                data_body.append(body)

            self.status = status.HTTP_200_OK
            self.data = data_body
            return Response(self.response_obj)

        except Exception as e:
            self.error = str(e)
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)
