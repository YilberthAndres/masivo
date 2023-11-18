import dotenv, os, requests
from pydantic import ValidationError
from django.shortcuts import get_object_or_404
from mensajeria.models import Archivos, Mensajeria, Conversaciones, Peticion

dotenv.load_dotenv()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


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


def post_conversation(recipient_id):
    conversacion = Conversaciones.objects.update_or_create(
        destinatario_id=recipient_id, defaults={"estado_id": 758}
    )
    if isinstance(conversacion, tuple):
        conversacion = conversacion[0]
    return conversacion.id


def send_message_api(data):
    try:
        payload = get_payload(
            data["recipient_w"], data["message"], data["type_message"], data["file_id"]
        )

        response = response = api_connect(
            ID_WHATSAPP_NUMBER_ENV, "/messages", payload=payload, method="POST"
        )
        response_json = response.json()

        conversacion_id = post_conversation(data["recipient_id"])

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
            mime_type = "document"

        nuevo_mensaje = Mensajeria(
            destinatario_id=data["recipient_id"],
            texto=data["message"],
            celular=waId,
            recipiente_id=waId,
            mensaje_id=messageId,
            conversacion_id=conversacion_id,
            mime_type=mime_type,
            created_by_id=data["user_id"],
        )

        if data["file_id"] != "":
            nuevo_mensaje.multimedia_id = data["file_id"]

        nuevo_mensaje.save()
        fecha = nuevo_mensaje.created_at.strftime("%Y/%m/%d")

        timestamp = nuevo_mensaje.created_at
        hora = timestamp.strftime("%H")
        minutos = timestamp.strftime("%M")
        hora_completa = hora + ":" + minutos

        return {
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
        }
    except Exception as e:
        return {"estado_envio": False}


def get_errors(errors):
    keys = errors.keys()

    if "non_field_errors" in keys:
        if len(errors["non_field_errors"]) == 1:
            return errors["non_field_errors"][0]
        return errors["non_field_errors"]


def validate_image(fieldfile_obj):
    filesize = fieldfile_obj.file.size
    megabyte_limit = 15.0
    if filesize > megabyte_limit * 1024 * 1024:
        raise ValidationError("Max file size is %sMB" % str(megabyte_limit))
