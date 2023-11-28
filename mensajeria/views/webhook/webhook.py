from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import (
    Paises,
    Peticion,
    Mensajeria,
    Destinatarios,
    Personas,
    Conversaciones,
    Archivos,
)
from django.core.exceptions import ObjectDoesNotExist
from channels.layers import get_channel_layer
from channels.db import database_sync_to_async
from asgiref.sync import async_to_sync
import requests
from datetime import datetime
import json
from django.db import connection
from django.core.files.storage import get_storage_class
import os
from django.core.files.base import ContentFile
from ..base import capture_first_page_from_s3

media_storage = get_storage_class()()
import hashlib
import re

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")
VERIFY_TOKEN_ENV = os.getenv("VERIFY_TOKEN")


@database_sync_to_async
def get_data():
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
                        WHERE c.estado_id = 758
                        AND DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%Y-%%m-%%d') >= CURDATE() - INTERVAL 300 DAY
                    ) AS subq
                    WHERE subq.row_num = 1;
                """
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

    return chats


def generate_permanent_token(request):
    user = request.user
    # token_generator = PasswordResetTokenGenerator()
    # token = token_generator.make_token(user)
    # response_data = {
    #     'token': token
    # }
    # return JsonResponse(response_data, status=200)


@csrf_exempt
def webhook(request):
    try:
        verify_token = VERIFY_TOKEN_ENV
        mode = request.GET.get("hub.mode")
        challenge = request.GET.get("hub.challenge")
        token = request.GET.get("hub.verify_token")
        json_data = json.loads(request.body)

        statuses_text = json.dumps(json_data["entry"])
        nueva_peticion = Peticion(estado=statuses_text)
        nueva_peticion.save()

        try:
            if json_data["entry"][0]["changes"][0]["field"] == "messages":
                if "statuses" in json_data["entry"][0]["changes"][0]["value"]:
                    # La clave 'statuses' existe en el arreglo
                    # dato = json_data['entry'][0]['changes'][0]['value']['statuses'][0]['status']
                    statuses = json_data["entry"][0]["changes"][0]["value"]["statuses"][
                        0
                    ]

                    update_message(statuses)

                if "messages" in json_data["entry"][0]["changes"][0]["value"]:
                    messages = json_data["entry"][0]["changes"][0]["value"]["messages"][
                        0
                    ]
                    perfil = json_data["entry"][0]["changes"][0]["value"]["contacts"][
                        0
                    ]["profile"]["name"]

                    new_message(messages, perfil)

        except Exception as e:
            error_message = str(e)
            nueva_peticion = Peticion(estado="error1: " + error_message)
            nueva_peticion.save()

        if mode and token:
            if mode == "subscribe" and token == verify_token:
                return HttpResponse(challenge, content_type="text/plain")

        raise Exception("Invalid request")

    except Exception as e:
        nueva_peticion = Peticion(estado="Error peticion inicial: " + str(e.args))
        nueva_peticion.save()
        nueva_peticion = Peticion(estado=e)
        nueva_peticion.save()
        return HttpResponse(challenge, content_type="text/plain")


def update_message(statuses):
    try:
        mensaje_id = statuses["id"]
        timestamp = statuses["timestamp"]
        recipiente_id = statuses["recipient_id"]

        if "sent" == statuses["status"]:
            estado = 744
        if "delivered" == statuses["status"]:
            estado = 745
        if "read" == statuses["status"]:
            estado = 746

        mensaje = Mensajeria.objects.get(mensaje_id=mensaje_id)
        mensaje.estado_id = estado
        mensaje.timestamp_w = timestamp
        mensaje.recipiente_id = recipiente_id
        # mensaje.conversacion_id = conversacion_id
        mensaje.save()
    except Exception as e:
        nueva_peticion = Peticion(estado="Error al actualizar mensaje: ")
        nueva_peticion.save()
        nueva_peticion = Peticion(estado=e)
        nueva_peticion.save()


def get_binary_search(arr, target):
    left, right = 0, len(arr) - 1

    while left <= right:
        mid = (left + right) // 2

        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1


def new_message(message, perfil):
    message_id = message["id"]
    from_num = message["from"]
    timestamp = message["timestamp"]
    type = message["type"]
    estado = 745

    try:
        persona = Personas.objects.get(telefonowhatsapp=from_num)
        persona_id = persona.id

        envia = Destinatarios.objects.get(persona_id=persona_id)
        envia_id = envia.id

    except ObjectDoesNotExist:
        resultado = from_num[2:]
        codigo_pais = from_num[:2]
        paises_actuales = Paises.objects.all()
        paises_validos = []
        for pais in paises_actuales:
            paises_validos.append(pais.codigo)

        try:
            if pais == "57":
                pais_id = 39
            else:
                index = get_binary_search(paises_validos, codigo_pais)

                if index != -1:
                    pais_id = index + 1
                else:
                    pais_id = 39

        except ValueError:
            pais_id = 39

        nueva_persona = Personas(
            nombre="",
            segundonombre="",
            apellido="",
            segundoapellido="",
            telefonowhatsapp=from_num,
            telefonomovil=resultado,
            pais_id=pais_id,
            sexo_id=23,
            created_by_id=1,
        )

        nueva_persona.save()
        persona_id = nueva_persona.id

        envia = Destinatarios(persona_id=persona_id, created_by_id=1, estado_id=596)
        envia.save()
        envia_id = envia.id

    try:
        try:
            conversacion = Conversaciones.objects.get(destinatario_id=envia_id)
            conversacion.estado_id = 758
            conversacion.save()

            conversacion_id = conversacion.id
        except ObjectDoesNotExist:
            conversacion = Conversaciones(
                destinatario_id=envia_id, created_by_id=1, estado_id=758
            )
            conversacion.save()
            conversacion_id = conversacion.id

        if type == "text":
            text = message["text"]["body"]
            nuevo_mensaje = Mensajeria(
                texto=text,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                tipo_id=748,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )

            nuevo_mensaje.save()
            hora_minutos = getMinutosHoras(timestamp)
            fecha = nuevo_mensaje.created_at.strftime("%Y/%m/%d")

            message_body = {
                "recipiente_id": nuevo_mensaje.recipiente_id,
                "fecha": fecha,
                "id": nuevo_mensaje.id,
                "estado": "enviado" if nuevo_mensaje.estado_id == None else "recibido",
                "texto": nuevo_mensaje.texto,
                "mensaje_id": nuevo_mensaje.mensaje_id,
                "mime_type": nuevo_mensaje.mime_type,
                "dir": nuevo_mensaje.link,
                "filename": nuevo_mensaje.filename,
                "voice": nuevo_mensaje.voice,
                "hora": hora_minutos,
                "timestamp_w": hora_minutos,
            }

            send_txt(message_body)

        else:
            mime_type = message[type]["mime_type"]
            sha256 = message[type]["sha256"]
            multimedia_id = message[type]["id"]
            if type == "document":
                filename = message["document"]["filename"]
            else:
                filename = ""

            file_id = post_send_file(multimedia_id, envia_id)
            nuevo_mensaje = Mensajeria(
                mime_type=mime_type,
                sha256=sha256,
                multimedia_id_id=file_id,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                filename=filename,
                tipo_id=750,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()

            ruta = get_likFile(file_id)
            hora_minutos = getMinutosHoras(timestamp)
            fecha = nuevo_mensaje.created_at.strftime("%Y/%m/%d")

            message_body = {
                "recipiente_id": nuevo_mensaje.recipiente_id,
                "fecha": fecha,
                "id": nuevo_mensaje.id,
                "estado": "enviado" if nuevo_mensaje.estado_id == None else "recibido",
                "texto": nuevo_mensaje.texto,
                "mensaje_id": nuevo_mensaje.mensaje_id,
                "mime_type": nuevo_mensaje.mime_type,
                "filename": nuevo_mensaje.filename,
                "voice": nuevo_mensaje.voice,
                "hora": hora_minutos,
                "timestamp_w": hora_minutos,
                "multimedia": {
                    "url": ruta["dir"],
                    "name": ruta["name"],
                    "preview": ruta["preview"],
                },
            }

            post_sendMedia(message_body)

    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo creando: " + error_message)
        nueva_peticion.save()


def getMinutosHoras(timestamp):
    timestamp_unix = int(timestamp)
    datetime_object = datetime.fromtimestamp(timestamp_unix)
    hora = datetime_object.hour
    minutos = datetime_object.minute
    horaMinutos = str(hora) + ":" + str(minutos)

    return horaMinutos


def send_txt(message):
    try:
        channel_layer = get_channel_layer()

        async_to_sync(channel_layer.group_send)(
            "chat_riodev",
            {"type": "chatbox_message", "message": {**message}},
        )

    except Exception as e:
        error_message = str(e.args)
        nueva_peticion = Peticion(estado="Fallo websockets: " + error_message)
        nueva_peticion.save()


def post_send_file(media_id, create_by):
    url = "https://graph.facebook.com/" + API_VERSION_WHATSAPP_ENV + "/" + media_id
    headers = {
        "Authorization": "Bearer " + API_KEY_ENV,
        "Content-Type": "application/json",
    }
    response = requests.get(url, headers=headers)
    response_json = response.json()

    # if response_media.status_code == 200:
    url_media = response_json["url"]
    response_media = requests.get(url_media, headers=headers)
    nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()
    extension_archivo = response_media.headers.get("Content-Type", "").split("/")[-1]

    nombre_archivo = re.sub(r'[\\/*?:"<>|]', "", nombre_archivo)

    nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

    try:
        tipo = None
        if extension_archivo == "pdf":
            tipo = "application/pdf"

        file_model = Archivos()
        file_model.nombre = nombre_archivo_con_extension
        file_model.grupo = 2
        file_model.created_by_id = 1
        file_model.tipo = tipo
        file_model.file.save(
            nombre_archivo_con_extension,
            ContentFile(response_media.content),
        )
        rep = capture_first_page_from_s3("masivo", "static/" + file_model.file.name)
        file_model.preview = rep

        file_model.save()
    except Exception as e:
        print("Error cargando el archivo: " + str(e))

    return file_model.id


def get_likFile(file_id):
    archivos = Archivos.objects.filter(id=file_id)
    files = []
    pre = None

    for archivo in archivos:
        if archivo.preview:
            pre = archivo.preview

        elif archivo.tipo == "application/pdf":
            pre = capture_first_page_from_s3("masivo", "static/" + archivo.file.name)

        aws_file = {
            "file_id": archivo.id,
            "name": archivo.nombre,
            "dir": media_storage.url(name=archivo.file.name),
            "type": archivo.tipo,
            "preview": pre,
        }

        files.append(aws_file)

    return files[0]


def post_sendMedia(message):
    try:
        channel_layer = get_channel_layer()

        async_to_sync(channel_layer.group_send)(
            "chat_riodev",
            {"type": "chatbox_message", "message": {**message}},
        )

    except Exception as e:
        error_message = str(e.args)
        nueva_peticion = Peticion(estado="Fallo websockets: " + error_message)
        nueva_peticion.save()


def clean_filename(filename):
    cleaned_filename = re.sub(r"[^\w.-]", "", filename)
    return cleaned_filename
