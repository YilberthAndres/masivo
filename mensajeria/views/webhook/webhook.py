from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import Peticion, Mensajeria
import json
from django.http import JsonResponse

def generate_permanent_token(request):
    user = request.user
    token_generator = PasswordResetTokenGenerator()
    token = token_generator.make_token(user)
    response_data = {
        'token': token
    }
    return JsonResponse(response_data, status=200)


@csrf_exempt
def webhook(request):
    try:
        verify_token = 'riodev1998'
        mode = request.GET.get('hub.mode')
        challenge = request.GET.get('hub.challenge')
        token = request.GET.get('hub.verify_token')
        json_data = json.loads(request.body)

        try:

            if(json_data['entry'][0]['changes'][0]['field'] == 'messages'):

                if 'statuses' in json_data['entry'][0]['changes'][0]['value']:
                    # La clave 'statuses' existe en el arreglo
                    # dato = json_data['entry'][0]['changes'][0]['value']['statuses'][0]['status']
                    statuses = json_data['entry'][0]['changes'][0]['value']['statuses'][0]
                    update_message(statuses)
                    # Realiza las operaciones necesarias con 'statuses'
                
                if 'messages' in json_data['entry'][0]['changes'][0]['value']:
                    statuses = json_data['entry'][0]['changes'][0]['value']['messages']

                
            # if(dato):
            #     nueva_peticion = Peticion(estado = dato)
            #     nueva_peticion.save()
            # else:
            #     nueva_peticion = Peticion(estado = 'Fallo')
            #     nueva_peticion.save()
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
        recipiente_id    = statuses['recipient_id']

        if('sent' == statuses['status']):
            estado = 744
        if('delivered' == statuses['status']):
            estado = 745
        if('read' == statuses['status']):
            estado = 746
        

        mensaje = Mensajeria.objects.get(mensaje_id=mensaje_id)
        mensaje.estado_id = estado
        mensaje.timestamp = timestamp
        mensaje.recipiente_id = recipiente_id
        mensaje.save()
    except Exception as e:
        nueva_peticion = Peticion(estado = 'Fallo')
        nueva_peticion.save()