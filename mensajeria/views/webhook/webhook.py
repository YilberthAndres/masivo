from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import (
    Peticion,
    Mensajeria,
    Destinatarios,
    Personas,
    Conversaciones,
)
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist
from channels.layers import get_channel_layer
from channels.db import database_sync_to_async
from asgiref.sync import async_to_sync
import requests
from datetime import datetime, timezone
from django.conf import settings
import json
from django.db import connection
from django.core.files.storage import get_storage_class
import os
import asyncio

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

    print(rows)
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

        # El registro existe
    except ObjectDoesNotExist:
        resultado = from_num[2:]
        nueva_persona = Personas(
            nombre="",
            segundonombre="",
            apellido="",
            segundoapellido="",
            telefonowhatsapp=from_num,
            telefonomovil=resultado,
            created_by_id=1,
        )

        nueva_persona.save()
        persona_id = nueva_persona.id

        # nombre_persona = nueva_persona.nombre + ' ' + nueva_persona.segundonombre

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
                "estado_id": nuevo_mensaje.estado_id,
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

        elif type == "image":
            mime_type = message["image"]["mime_type"]
            sha256 = message["image"]["sha256"]
            multimedia_id = message["image"]["id"]
            nuevo_mensaje = Mensajeria(
                mime_type=mime_type,
                sha256=sha256,
                multimedia_id=multimedia_id,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                tipo_id=750,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()
            horaMinutos = getMinutosHoras(timestamp)
            get_media(multimedia_id, message_id, horaMinutos, from_num, mime_type)
            # get_media(media_id, message_id, timestamp_w, recipiente_id, mime_type):
        elif type == "video":
            mime_type = message["video"]["mime_type"]
            sha256 = message["video"]["sha256"]
            multimedia_id = message["video"]["id"]
            nuevo_mensaje = Mensajeria(
                mime_type=mime_type,
                sha256=sha256,
                multimedia_id=multimedia_id,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                tipo_id=755,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()
            horaMinutos = getMinutosHoras(timestamp)
            get_media(multimedia_id, message_id, horaMinutos, from_num, mime_type)

        elif type == "document":
            mime_type = message["document"]["mime_type"]
            sha256 = message["document"]["sha256"]
            multimedia_id = message["document"]["id"]
            filename = message["document"]["filename"]
            nuevo_mensaje = Mensajeria(
                mime_type=mime_type,
                sha256=sha256,
                multimedia_id=multimedia_id,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                filename=filename,
                tipo_id=756,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()
            horaMinutos = getMinutosHoras(timestamp)
            get_file(
                multimedia_id, filename, message_id, horaMinutos, from_num, mime_type
            )
        elif type == "audio":
            mime_type = message["audio"]["mime_type"]
            sha256 = message["audio"]["sha256"]
            multimedia_id = message["audio"]["id"]
            voice = message["audio"]["voice"]
            nuevo_mensaje = Mensajeria(
                mime_type=mime_type,
                sha256=sha256,
                multimedia_id=multimedia_id,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                voice=voice,
                tipo_id=756,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()
            horaMinutos = getMinutosHoras(timestamp)
            get_audio(
                multimedia_id, message_id, horaMinutos, from_num, mime_type, voice
            )
            # get_media(media_id, message_id, timestamp_w, recipiente_id, mime_type):
        else:
            nuevo_mensaje = Mensajeria(
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                tipo_id=751,
                estado_id=estado,
                conversacion_id=conversacion_id,
            )
            nuevo_mensaje.save()

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


# Vista donde quieres enviar el mensaje al WebSocketGroup


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


def get_media(media_id, message_id, timestamp_w, recipiente_id, mime_type):
    try:
        url = "https://graph.facebook.com/" + API_VERSION_WHATSAPP_ENV + "/" + media_id
        headers = {"Authorization": API_KEY_ENV, "Content-Type": "application/json"}

        response = requests.get(url, headers=headers)
        response_json = response.json()

        url_media = response_json["url"]

        response_media = requests.get(url_media, headers=headers)

        if response_media.status_code == 200:
            nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()
            extension_archivo = response_media.headers.get("Content-Type", "").split(
                "/"
            )[-1]

            # Elimina los caracteres inválidos para el nombre del archivo
            nombre_archivo = re.sub(r'[\\/*?:"<>|]', "", nombre_archivo)

            # Combina el nombre del archivo y su extensión
            nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

            # Construye la ruta completa para guardar el archivo en la carpeta deseada
            ruta_archivo = os.path.join(
                settings.BASE_DIR,
                "mensajeria",
                "static",
                "temp",
                nombre_archivo_con_extension,
            )

            # Abre el archivo en modo binario y guarda el contenido de la respuesta en él
            with open(ruta_archivo, "wb") as archivo:
                archivo.write(response_media.content)

            mensaje = Mensajeria.objects.get(mensaje_id=message_id)
            mensaje.link = "static/temp/" + nombre_archivo_con_extension
            # mensaje.conversacion_id = conversacion_id
            mensaje.save()

            link = "static/temp/" + nombre_archivo_con_extension

            send_media(message_id, timestamp_w, recipiente_id, mime_type, link, "")
            # Devuelve una respuesta con el enlace a la imagen descargada
            return HttpResponse(f"Imagen descargada y guardada en: {ruta_archivo}")
        else:
            return HttpResponse("Error al descargar la imagen", status=404)
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo guardando multimedia: " + error_message)
        nueva_peticion.save()


def get_audio(multimedia_id, message_id, timestamp_w, recipiente_id, mime_type, voice):
    try:
        url = (
            "https://graph.facebook.com/"
            + API_VERSION_WHATSAPP_ENV
            + "/"
            + multimedia_id
        )
        headers = {"Authorization": API_KEY_ENV, "Content-Type": "application/json"}

        response = requests.get(url, headers=headers)
        response_json = response.json()

        url_media = response_json["url"]

        response_media = requests.get(url_media, headers=headers)

        if response_media.status_code == 200:
            nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()

            extension_archivo = response_media.headers.get("Content-Type", "").split(
                "/"
            )[-1]

            # Elimina los caracteres inválidos para el nombre del archivo
            nombre_archivo = re.sub(r'[\\/*?:"<>|]', "", nombre_archivo)

            # Combina el nombre del archivo y su extensión
            nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

            # Construye la ruta completa para guardar el archivo en la carpeta deseada
            ruta_archivo = os.path.join(
                settings.BASE_DIR,
                "mensajeria",
                "static",
                "temp",
                nombre_archivo_con_extension,
            )

            # Abre el archivo en modo binario y guarda el contenido de la respuesta en él
            with open(ruta_archivo, "wb") as archivo:
                archivo.write(response_media.content)

            mensaje = Mensajeria.objects.get(mensaje_id=message_id)
            mensaje.link = "static/temp/" + nombre_archivo_con_extension
            # mensaje.conversacion_id = conversacion_id
            mensaje.save()

            link = "static/temp/" + nombre_archivo_con_extension

            send_media(message_id, timestamp_w, recipiente_id, mime_type, link, voice)
            # Devuelve una respuesta con el enlace a la imagen descargada
            return HttpResponse(f"Imagen descargada y guardada en: {ruta_archivo}")
        else:
            return HttpResponse("Error al descargar la imagen", status=404)
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo guardando multimedia: " + error_message)
        nueva_peticion.save()


# import os
# import re
# import hashlib

import re
import hashlib

# Otras importaciones y definiciones de funciones...


def clean_filename(filename):
    # Remueve caracteres inválidos para nombres de archivo, excepto letras, números y guiones bajos
    cleaned_filename = re.sub(r"[^\w.-]", "", filename)
    return cleaned_filename


def get_file(media_id, filename, message_id, timestamp_w, recipiente_id, mime_type):
    try:
        url = "https://graph.facebook.com/" + API_VERSION_WHATSAPP_ENV + "/" + media_id
        headers = {"Authorization": API_KEY_ENV, "Content-Type": "application/json"}

        response = requests.get(url, headers=headers)
        response_json = response.json()

        url_media = response_json["url"]

        response_media = requests.get(url_media, headers=headers)

        # Resto del código para descargar y guardar el archivo...
        # ...

        if response_media.status_code == 200:
            nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()

            extension_archivo = response_media.headers.get("Content-Type", "").split(
                "/"
            )[-1]

            # Combina el nombre del archivo y su extensión
            nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

            # Limpia el nombre del archivo para eliminar caracteres inválidos
            nombre_archivo_con_extension = clean_filename(filename)

            # Construye la ruta completa para guardar el archivo en la carpeta deseada
            ruta_archivo = os.path.join(
                settings.BASE_DIR,
                "mensajeria",
                "static",
                "temp",
                nombre_archivo_con_extension,
            )

            # Abre el archivo en modo binario y guarda el contenido de la respuesta en él
            with open(ruta_archivo, "wb") as archivo:
                archivo.write(response_media.content)

            mensaje = Mensajeria.objects.get(mensaje_id=message_id)
            mensaje.link = "static/temp/" + nombre_archivo_con_extension
            mensaje.save()

            link = "static/temp/" + nombre_archivo_con_extension

            send_file(message_id, timestamp_w, recipiente_id, mime_type, link, filename)
            # Devuelve una respuesta con el enlace a la imagen descargada
            return HttpResponse(f"Archivo descargado y guardado en: {ruta_archivo}")
        else:
            return HttpResponse("Error al descargar el archivo", status=404)
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo guardando archivo: " + error_message)
        nueva_peticion.save()


def send_media(id, timestamp_w, recipiente_id, mime_type, link, voice):
    try:
        # Obtén los datos del mensaje y el nombre de usuario de alguna manera
        # message = "Hola, esto es un mensaje enviado desde otra vista"
        # username = "Usuario1"

        # Obtén el channel_layer
        channel_layer = get_channel_layer()

        # Envia el mensaje al grupo del WebSocketGroup usando async_to_sync
        async_to_sync(channel_layer.group_send)(
            "chat_riodev",
            {
                "type": "chatbox_message",
                "id": id,
                "message": "",
                "timestamp_w": timestamp_w,
                "recipiente_id": recipiente_id,
                "mime_type": mime_type,
                "link": link,
                "filename": "",
                "voice": voice,
            },
        )
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo websockets: " + error_message)
        nueva_peticion.save()


def send_file(id, timestamp_w, recipiente_id, mime_type, link, filename):
    try:
        # Obtén los datos del mensaje y el nombre de usuario de alguna manera
        # message = "Hola, esto es un mensaje enviado desde otra vista"
        # username = "Usuario1"

        # Obtén el channel_layer
        channel_layer = get_channel_layer()

        # Envia el mensaje al grupo del WebSocketGroup usando async_to_sync
        async_to_sync(channel_layer.group_send)(
            "chat_riodev",
            {
                "type": "chatbox_message",
                "id": id,
                "message": "",
                "timestamp_w": timestamp_w,
                "recipiente_id": recipiente_id,
                "mime_type": mime_type,
                "link": link,
                "filename": filename,
                "voice": "",
            },
        )
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo websockets: " + error_message)
        nueva_peticion.save()
