from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import Peticion, Mensajeria, Destinatarios, Personas
import json
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist
import os
import dotenv
dotenv.load_dotenv()

import json
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
import requests
import os
from datetime import datetime
from django.conf import settings
import json
import dotenv
dotenv.load_dotenv()

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
        mode = request.GET.get('hub.mode')
        challenge = request.GET.get('hub.challenge')
        token = request.GET.get('hub.verify_token')
        json_data = json.loads(request.body)

        statuses_text = json.dumps(json_data['entry'])
        nueva_peticion = Peticion(estado = statuses_text)
        nueva_peticion.save()
        # enviar_mensaje_a_grupo()

        try:

            if(json_data['entry'][0]['changes'][0]['field'] == 'messages'):

                if 'statuses' in json_data['entry'][0]['changes'][0]['value']:
                    # La clave 'statuses' existe en el arreglo
                    # dato = json_data['entry'][0]['changes'][0]['value']['statuses'][0]['status']
                    statuses = json_data['entry'][0]['changes'][0]['value']['statuses'][0]
                    
                    update_message(statuses)

                if 'messages' in json_data['entry'][0]['changes'][0]['value']:
                    messages = json_data['entry'][0]['changes'][0]['value']['messages'][0]
                    perfil   = json_data['entry'][0]['changes'][0]['value']['contacts'][0]['profile']['name']
                    
                    new_message(messages, perfil)

        except Exception as e:
            error_message = str(e)
            nueva_peticion = Peticion(estado = 'error: ' + error_message)
            nueva_peticion.save()

        if mode and token:            
            if mode == 'subscribe' and token == verify_token:
                return HttpResponse(challenge, content_type='text/plain')
            

        raise Exception('Invalid request')

    except Exception as e:
        return HttpResponse(challenge, content_type='text/plain')



def update_message(statuses):
    try:
        mensaje_id      = statuses['id']
        timestamp       = statuses['timestamp']
        recipiente_id   = statuses['recipient_id']
        # conversacion_id = id

        if('sent' == statuses['status']):
            estado = 744
        if('delivered' == statuses['status']):
            estado = 745
        if('read' == statuses['status']):
            estado = 746
        

        mensaje                 = Mensajeria.objects.get(mensaje_id=mensaje_id)
        mensaje.estado_id       = estado
        mensaje.timestamp_w     = timestamp
        mensaje.recipiente_id   = recipiente_id
        # mensaje.conversacion_id = conversacion_id
        mensaje.save()
    except Exception as e:
        nueva_peticion = Peticion(estado = 'Fallo')
        nueva_peticion.save()


def new_message(message, perfil):
    
    message_id      = message['id']
    from_num        = message['from']
    timestamp       = message['timestamp']
    type            = message['type']
    estado          = 745

    try:
        persona = Personas.objects.get(telefonowhatsapp=from_num)
        # El registro existe
    except ObjectDoesNotExist:
        resultado = from_num[2:]
        nueva_persona = Personas(
            nombre            = '',
            segundonombre    = '',
            apellido          = '',
            segundoapellido  = '',
            telefonowhatsapp  = from_num,
            telefonomovil     = resultado,
            created_by_id        = 1
        )

        nueva_persona.save()
        persona_id = nueva_persona.id

        # nombre_persona = nueva_persona.nombre + ' ' + nueva_persona.segundonombre

        nuevo_registro = Destinatarios(
            persona_id=persona_id, created_by_id=1, estado_id=596
        )
        nuevo_registro.save()

    try:
        if(type == 'text'):
            text            = message['text']['body']
            nuevo_mensaje = Mensajeria(
                texto             = text,
                celular           = from_num,
                recipiente_id     = from_num,
                mensaje_id        = message_id,
                timestamp_w       = timestamp,
                tipo_id           = 748,
                estado_id         = estado
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
        nueva_peticion = Peticion(estado = 'Fallo creando: ' + error_message)
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


def get_media(media_id):
    url = 'https://graph.facebook.com/'+API_VERSION_WHATSAPP_ENV+'/'+media_id
    headers = {
        'Authorization': API_KEY_ENV,
        'Content-Type': 'application/json'
    }


    response = requests.get(url, headers=headers)
    response_json = response.json()
    return JsonResponse(response_json)