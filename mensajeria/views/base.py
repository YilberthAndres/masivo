import dotenv, os, requests
from datetime import datetime
from django.shortcuts import get_object_or_404
from mensajeria.models import Archivos, Mensajeria, Conversaciones
from django.core.files.storage import get_storage_class
import fitz
from PIL import Image
from io import BytesIO
import boto3
import requests
import base64

media_storage = get_storage_class()()
dotenv.load_dotenv()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")
AWS_ACCESS_KEY_ID_ENV = os.getenv("AWS_ACCESS_KEY_ID_N")
AWS_SECRET_ACCESS_KEY_ENV = os.getenv("AWS_SECRET_ACCESS_KEY_N")
AWS_STORAGE_BUCKET_NAME_ENV = os.getenv("AWS_STORAGE_BUCKET_NAME")
AWS_S3_REGION_NAME_ENV = os.getenv("AWS_S3_REGION_NAME")


def api_connect(id_whatsap, path: str, payload={}, method="GET", headers={}):
    url = (
        "https://graph.facebook.com/"
        + API_VERSION_WHATSAPP_ENV
        + "/"
        + id_whatsap
        + path
    )

    headers = {
        "Authorization": f"Bearer {API_KEY_ENV}",
        "Content-Type": "application/json",
        **headers,
    }

    if method == "GET":
        return requests.get(url, headers=headers)

    return requests.post(url, headers=headers, json=payload)


def get_payload(whatsapp, text, type_message, file_id):
    if type_message == "text":
        return {
            "messaging_product": "whatsapp",
            "recipient_type": "individual",
            "to": whatsapp,
            "type": "text",
            "text": {"preview_url": False, "body": text},
        }
    else:
        data = get_object_or_404(Archivos, pk=file_id)
        url_archivo = data.file.url
        return {
            "messaging_product": "whatsapp",
            "to": whatsapp,
            "type": type_message,
            "" + type_message + "": {"link": url_archivo},
        }


def post_conversation(data):
    conversacion = Conversaciones.objects.update_or_create(
        destinatario_id=data["recipient_id"],
        defaults={"estado_id": 758},
        created_by=data["user"],
    )
    if isinstance(conversacion, tuple):
        conversacion = conversacion[0]
    return conversacion.id


def send_message_api(data):
    try:
        payload = get_payload(
            data["recipient_w"],
            data["message"],
            data["type_message"],
            data["file_id"],
        )

        response = response = api_connect(
            ID_WHATSAPP_NUMBER_ENV, "/messages", payload=payload, method="POST"
        )
        response_json = response.json()

        conversacion_id = post_conversation(data)

        waId = response_json["contacts"][0]["wa_id"]
        messageId = response_json["messages"][0]["id"]

        mime_type = ""
        tipo = data["type_message"]
        if tipo == "image":
            mime_type = "image/jpeg"
        elif tipo == "video":
            mime_type = "video/mp4"
        elif tipo == "audio":
            mime_type = "audio/mpeg"
        elif tipo == "document":
            mime_type = "document"
        elif tipo == "text":
            mime_type = None

        nuevo_mensaje = Mensajeria(
            destinatario_id=data["recipient_id"],
            texto=data["message"],
            celular=waId,
            recipiente_id=waId,
            mensaje_id=messageId,
            conversacion_id=conversacion_id,
            mime_type=mime_type,
            created_by=data["user"],
            timestamp_w=datetime.now().timestamp(),
        )

        if data["file_id"] != "":
            nuevo_mensaje.multimedia_id_id = data["file_id"]

        nuevo_mensaje.save()
        fecha = nuevo_mensaje.created_at.strftime("%Y/%m/%d")

        timestamp = nuevo_mensaje.created_at
        hora = timestamp.strftime("%H")
        minutos = timestamp.strftime("%M")
        hora_completa = hora + ":" + minutos

        response = {
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
            "hora": hora_completa,
            "estado_envio": True,
            "multimedia": {"url": None, "name": None},
        }

        if nuevo_mensaje.multimedia_id != None:
            response["multimedia"] = {
                "url": media_storage.url(nuevo_mensaje.multimedia_id.file.name),
                "name": nuevo_mensaje.multimedia_id.nombre,
                "weight": nuevo_mensaje.multimedia_id.weight_file,
                "preview": nuevo_mensaje.multimedia_id.preview,
                "pages": nuevo_mensaje.multimedia_id.page_count
            }

        return response
    except Exception as e:
        return {
            "error": str(e.args),
            "estado_envio": False,
        }


def get_errors(errors):
    keys = errors.keys()

    if "non_field_errors" in keys:
        if len(errors["non_field_errors"]) == 1:
            return errors["non_field_errors"][0]
        return errors["non_field_errors"]


def capture_first_page_from_s3(bucket_name, key):
    s3 = boto3.client(
        "s3",
        aws_access_key_id=AWS_ACCESS_KEY_ID_ENV,
        aws_secret_access_key=AWS_SECRET_ACCESS_KEY_ENV,
        region_name=AWS_S3_REGION_NAME_ENV,
    )
    response = s3.get_object(Bucket=bucket_name, Key=key)
    content = response["Body"].read()
    
    size_in_bytes = response['ContentLength']

    size_in_kb = size_in_bytes / 1024.0
    size_in_mb = size_in_kb / 1024.0


    document = fitz.open("pdf", content)

    first_page = document[0]
    count_page = document.page_count

    pixmap = first_page.get_pixmap()

    image = Image.frombytes("RGB", [pixmap.width, pixmap.height], pixmap.samples)

    buffered = BytesIO()
    image.save(buffered, format="PNG")
    image_base64 = base64.b64encode(buffered.getvalue()).decode("utf-8")

    document.close()

    return image_base64, count_page, size_in_mb
