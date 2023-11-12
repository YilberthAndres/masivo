from django.db import connection
from rest_framework.generics import CreateAPIView, GenericAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from django.core import serializers
import json
from mensajeria.models import (
    Archivos,
    Destinatarios,
    Mensajeria,
    Personas,
    Conversaciones,
    Peticion,
)
from django.utils import timezone
from mensajeria.tasks import my_task
from django.db.models.functions import TruncDate
from django.db.models import Count, Case, When, Value, CharField
from datetime import datetime
from datetime import timedelta
import os
import requests
from django.core.exceptions import ObjectDoesNotExist

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

            self.data = {"status": status.HTTP_200_OK, "data": data, "state": True}
            return Response(self.response_obj)
        except Exception as e:
            self.error = {
                "status": status.HTTP_404_NOT_FOUND,
                "message": str(e, args),
                "state": True,
            }
            return Response(self.response_obj)


class MenssageFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            telefonowhatsapp = request.GET.get("user_phone")

            persona = Personas.objects.filter(telefonowhatsapp=telefonowhatsapp).first()

            if persona:
                persona_data = json.loads(serializers.serialize("json", [persona]))[0]

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
                    )
                    .annotate(cantidad_registros=Count("id"))
                    .order_by("fecha", "created_at")
                )

                resultados = {}
                for mensaje in mensajes:
                    # fecha = mensaje['fecha'].strftime('%Y-%m-%d')
                    fecha_int = float(mensaje["timestamp_w"])
                    fecha_datetime = timezone.datetime.fromtimestamp(fecha_int)
                    fecha = fecha_datetime.strftime("%Y/%m/%d")

                    timestamp = float(mensaje["timestamp_w"])
                    fecha_hora = datetime.fromtimestamp(timestamp)
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

                # Devolver la respuesta JSON
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
                response_data = {
                    "status": status.HTTP_404_NOT_FOUND,
                    "message": "No tienes acceso.",
                    "state": False,
                }
                return Response(response_data)
        except Exception as e:
            response_data = {
                "status": status.HTTP_404_NOT_FOUND,
                "message": "No tienes acceso.",
                "state": False,
            }
            return Response(response_data)


class MenssageSend(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get_payload(self, whatsapp, text, type_message):
        if type_message == "text":
            return {
                "messaging_product": "whatsapp",
                "recipient_type": "individual",
                "to": whatsapp,
                "type": "text",
                "text": {"preview_url": False, "body": text},
            }

    def post_conversation(self, recipient_id):
        conversacion = Conversaciones.objects.update_or_create(
            destinatario_id=recipient_id, defaults={"estado_id": 758}
        )
        if isinstance(conversacion, tuple):
            conversacion = conversacion[0]
        return conversacion.id

    def post(self, request, *args, **kwargs):
        # try:
        info = json.loads(request.body)
        recipient = info[0]["recipient"]
        message = info[0]["message"]
        type_message = info[0]["type"]

        user = request.user
        data = {
            "recipient": recipient,
            "message": message,
            "user_id": user.id,
        }

        persona_model = Personas.objects.get(telefonowhatsapp=recipient)
        recipient_model = Destinatarios.objects.get(persona=persona_model)
        user_whatsapp = persona_model.telefonowhatsapp
        recipient_id = recipient_model.id

        if persona_model:
            url = (
                "https://graph.facebook.com/"
                + API_VERSION_WHATSAPP_ENV
                + "/"
                + ID_WHATSAPP_NUMBER_ENV
                + "/messages"
            )
            headers = {
                "Authorization": f"Bearer {API_KEY_ENV}",
                "Content-Type": "application/json",
            }

            payload = self.get_payload(recipient, message, type_message)

            response = requests.post(url, headers=headers, json=payload)
            response_json = response.json()

            self.data = {
                "status": status.HTTP_200_OK,
                "data": {"payload": payload},
                "state": True,
            }

            conversacion_id = self.post_conversation(recipient_id)

            waId = response_json["contacts"][0]["wa_id"]
            messageId = response_json["messages"][0]["id"]

            nuevo_mensaje = Mensajeria(
                destinatario_id=recipient_id,
                texto=message,
                celular=waId,
                recipiente_id=waId,
                mensaje_id=messageId,
                conversacion_id=conversacion_id,
                created_by_id=user.id,
            )

            nuevo_mensaje.save()

            fecha = nuevo_mensaje.created_at.strftime("%Y/%m/%d")

            timestamp = nuevo_mensaje.created_at
            hora = timestamp.strftime("%H")
            minutos = timestamp.strftime("%M")
            hora_completa = hora + ":" + minutos

            data_message = {
                "recipiente_id": nuevo_mensaje.recipiente_id,
                "fecha": fecha,
                "id": nuevo_mensaje.id,
                "estado_id": nuevo_mensaje.estado_id,
                "texto": nuevo_mensaje.texto,
                "mensaje_id": nuevo_mensaje.mensaje_id,
                "mime_type": nuevo_mensaje.mime_type,
                "dir": nuevo_mensaje.link,
                "filename": nuevo_mensaje.filename,
                "voice": nuevo_mensaje.voice,
                "hora": hora_completa,
            }

            self.data = {
                "status": status.HTTP_200_OK,
                "data": data_message,
                "state": True,
            }
            return Response(self.response_obj)
        else:
            response_data = {
                "status": status.HTTP_404_NOT_FOUND,
                "message": "Error destinatario no valido",
                "state": False,
            }
            return Response(response_data)

    # except Exception as e:
    #     response_data = {"status": status.HTTP_404_NOT_FOUND, "message": "error", "state": False}
    #     return Response(response_data)
