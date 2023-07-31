from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import Peticion, Mensajeria, Destinatarios, Personas
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
import requests
from datetime import datetime
from django.conf import settings
import json
import dotenv

dotenv.load_dotenv()
import boto3
from django.core.files.storage import get_storage_class
import os



import hashlib
import re

API_KEY_ENV                 = os.getenv('API_KEY')
ID_WHATSAPP_BUSINESS_ENV    = os.getenv('ID_WHATSAPP_BUSINESS')
ID_WHATSAPP_NUMBER_ENV      = os.getenv('ID_WHATSAPP_NUMBER')
API_VERSION_WHATSAPP_ENV    = os.getenv('API_VERSION_WHATSAPP')
VERIFY_TOKEN_ENV = os.getenv('VERIFY_TOKEN')


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
        # enviar_mensaje_a_grupo()

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
            nueva_peticion = Peticion(estado="error: " + error_message)
            nueva_peticion.save()

        if mode and token:
            if mode == "subscribe" and token == verify_token:
                return HttpResponse(challenge, content_type="text/plain")

        raise Exception("Invalid request")

    except Exception as e:
        return HttpResponse(challenge, content_type="text/plain")


def update_message(statuses):
    try:
        mensaje_id = statuses["id"]
        timestamp = statuses["timestamp"]
        recipiente_id = statuses["recipient_id"]
        # conversacion_id = id

        if "sent" == statuses["status"]:
            estado = 744
        if "delivered" == statuses["status"]:
            estado = 745
        if "read" == statuses["status"]:
            estado = 746

        mensaje = Mensajeria.objects.get(mensaje_id=mensaje_id)
        # mensaje.estado_id       = estado
        mensaje.timestamp_w = timestamp
        mensaje.recipiente_id = recipiente_id
        # mensaje.conversacion_id = conversacion_id
        mensaje.save()
    except Exception as e:
        nueva_peticion = Peticion(estado="Fallo")
        nueva_peticion.save()


def new_message(message, perfil):
    message_id = message["id"]
    from_num = message["from"]
    timestamp = message["timestamp"]
    type = message["type"]
    estado = 745

    try:
        persona = Personas.objects.get(telefonowhatsapp=from_num)
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

        nuevo_registro = Destinatarios(
            persona_id=persona_id,
            created_by_id=1,
        )
        nuevo_registro.save()

    try:
        if type == "text":
            text = message["text"]["body"]
            nuevo_mensaje = Mensajeria(
                texto=text,
                celular=from_num,
                recipiente_id=from_num,
                mensaje_id=message_id,
                timestamp_w=timestamp,
                # tipo_id           = 748,
                # estado_id         = estado
            )

            nuevo_mensaje.save()

            send_txt(nuevo_mensaje.id, nuevo_mensaje.texto, nuevo_mensaje.timestamp_w, nuevo_mensaje.recipiente_id)



        elif(type == 'image'):

            mime_type      = message['image']['mime_type']
            sha256         = message['image']['sha256']
            multimedia_id  = message['image']['id']
            nuevo_mensaje  = Mensajeria(
                mime_type         = mime_type,
                sha256            = sha256,
                multimedia_id     = multimedia_id,
                celular           = from_num,
                recipiente_id     = from_num,
                mensaje_id        = message_id,
                timestamp_w         = timestamp,
                tipo_id           = 750,
                estado_id         = estado
            )
            nuevo_mensaje.save()
            get_media(multimedia_id, message_id)
        else: 
            nuevo_mensaje  = Mensajeria(
                celular           = from_num,
                recipiente_id     = from_num,
                mensaje_id        = message_id,
                timestamp_w         = timestamp,
                tipo_id           = 751,
                estado_id         = estado
            )
            nuevo_mensaje.save()

        

    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado="Fallo creando: " + error_message)
        nueva_peticion.save()



# Vista donde quieres enviar el mensaje al WebSocketGroup
def send_txt(id, message, timestamp_w, recipiente_id):

    try:
        # Obtén los datos del mensaje y el nombre de usuario de alguna manera
        # message = "Hola, esto es un mensaje enviado desde otra vista"
        # username = "Usuario1"

        # Obtén el channel_layer
        channel_layer = get_channel_layer()

        # Envia el mensaje al grupo del WebSocketGroup usando async_to_sync
        async_to_sync(channel_layer.group_send)('chat_riodev', {
            'type'          :   'chatbox_message',
            'id'           :   id,
            'message'       :   message,
            'timestamp_w'   :   timestamp_w,
            'recipiente_id' :   recipiente_id,
        })
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado = 'Fallo websockets: ' + error_message)
        nueva_peticion.save()


def get_media(media_id, message_id):
    try:
        url = 'https://graph.facebook.com/'+API_VERSION_WHATSAPP_ENV+'/'+media_id
        headers = {
            'Authorization': API_KEY_ENV,
            'Content-Type': 'application/json'
        }


        response = requests.get(url, headers=headers)
        response_json = response.json()

        url_media = response_json['url']

        response_media = requests.get(url_media, headers=headers)


        if response_media.status_code == 200:
            # Genera el nombre del archivo a partir de la URL usando un hash MD5
            nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()

            # Obtiene la extensión del archivo desde el encabezado Content-Type
            extension_archivo = response_media.headers.get('Content-Type', '').split('/')[-1]

            # Elimina los caracteres inválidos para el nombre del archivo
            nombre_archivo = re.sub(r'[\\/*?:"<>|]', '', nombre_archivo)

            # Combina el nombre del archivo y su extensión
            nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

            # Construye la ruta completa para guardar el archivo en la carpeta deseada
            ruta_archivo = os.path.join(settings.BASE_DIR, "mensajeria", "static", "temp", nombre_archivo_con_extension)

            # Abre el archivo en modo binario y guarda el contenido de la respuesta en él
            with open(ruta_archivo, 'wb') as archivo:
                archivo.write(response_media.content)

            # Devuelve una respuesta con el enlace a la imagen descargada
            return HttpResponse(f"Imagen descargada y guardada en: {ruta_archivo}")
        else:
            return HttpResponse("Error al descargar la imagen", status=404)
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado = 'Fallo guardando multimedia: ' + error_message)
        nueva_peticion.save()
