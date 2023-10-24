from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from mensajeria.models import Peticion, Mensajeria, Destinatarios, Personas, Conversaciones
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
import requests
from datetime import datetime
from django.conf import settings
import json
import dotenv
import os

API_KEY_ENV                 = os.getenv('API_KEY')
ID_WHATSAPP_BUSINESS_ENV    = os.getenv('ID_WHATSAPP_BUSINESS')
ID_WHATSAPP_NUMBER_ENV      = os.getenv('ID_WHATSAPP_NUMBER')
API_VERSION_WHATSAPP_ENV    = os.getenv('API_VERSION_WHATSAPP')
VERIFY_TOKEN_ENV            = os.getenv('VERIFY_TOKEN')





@csrf_exempt
def perfil_foto(request):
    print("ss")
    try:
        
        verify_token = VERIFY_TOKEN_ENV
        mode = request.GET.get("hub.mode")
        challenge = request.GET.get("hub.challenge")
        token = request.GET.get("hub.verify_token")
        json_data = json.loads(request.body)

        statuses_text = json.dumps(json_data["entry"])
        nueva_peticion = Peticion(estado=statuses_text)
        nueva_peticion.save()

        if mode and token:
            if mode == "subscribe" and token == verify_token:
                return HttpResponse(challenge, content_type="text/plain")
    except Exception as e:
        error_message = str(e)
        nueva_peticion = Peticion(estado = 'error1: ' + json_data)
        nueva_peticion.save()