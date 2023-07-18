import requests
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Destinatarios, Personas, Mensajeria
import os
from datetime import datetime
from django.conf import settings
import json

@login_required(login_url='signin')
def index(request):

    contexto = {
        'titulo': 'Chat',
    }
    return render(request, 'mensajes/index.html', contexto)

@login_required(login_url='signin')
def templates(request):

    url = 'https://graph.facebook.com/v17.0/103916249443809/message_templates'
    headers = {
        'Authorization': 'Bearer EAAEF7nFwsRoBAKuZC1ThcixZAfShD0mWwcKPtpZBHh9JfRKOLcNrwV2HnVgWwN5rzygHDX4mYRbY2TqZA5MVmad79cRZAKVGFJtIlG48mkUY6barPTeMhwxQpgBZAquwMGwurqo6gg6HqzO2gloreexkmjQDo8OJAUMxRkZA8ff074ZBAcijkTiE',
        'Content-Type': 'application/json'
    }

    response = requests.get(url, headers=headers)
    response_json = response.json()
    data = response_json['data']

    templates = []
    for item in data:
        id = item['id']
        status = item['status']
        name = item['name']

        # Crear un diccionario con los campos id, status y name
        resultado = {
            'id': id,
            'status': status,
            'name': name
        }

        # Agregar el diccionario al arreglo de resultados
        templates.append(resultado)

    # return JsonResponse(resultados, safe=False)


    contexto = {
        'titulo': 'Templates',
        'templates': templates
    }
    return render(request, 'mensajes/templates.html', contexto)


@login_required(login_url='signin')
def list_destinatarios(request):

    if request.method == 'POST':

        try:            
            destinatarios = Destinatarios.objects.all()
            destinatariosnew = []

            for destinatario in destinatarios:
                persona = destinatario.persona

                nombre_persona = persona.nombre + ' ' + persona.segundonombre + ' ' + persona.apellido + ' ' + persona.segundoapellido
                destinatarioslist = {
                    'id': destinatario.id,
                    'nombre': nombre_persona,
                    'celular': persona.telefonomovil
                }
                destinatariosnew.append(destinatarioslist)


            # Lógica adicional después de eliminar el registro
            return JsonResponse(destinatariosnew, safe=False)
        except Exception as e:
            error_message = str(e)
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': error_message})  


@login_required()
def send_message(request):
    if request.method == 'POST':

        destinatarios = request.POST.getlist('destinatarios')  # Obtener una lista de los valores de destinatarios
        mensaje = request.POST.get('mensaje')
        data = {'destinatarios': destinatarios}  # Crear un diccionario con el valor de destinatarios
        user = request.user
        # user = User.objects.get(id=user.id)
        # return JsonResponse(data)
        for destinatario in destinatarios:

            destinatario = Destinatarios.objects.get(id=destinatario)
            celular = destinatario.persona.telefonomovil
            # return JsonResponse({'destinatario_id': })

            # url = 'https://graph.facebook.com/v17.0/112605838565124/messages'
            # headers = {
            #     'Authorization': '',
            #     'Content-Type': 'application/json'
            # }
            # payload = {
            #     "messaging_product": "whatsapp",
            #     "to": "57"+celular,
            #     "type": "template",
            #     "template": {
            #         "name": "hello_world",
            #         "language": {
            #             "code": "en_US"
            #         }
            #     }
            # }
            url = 'https://graph.facebook.com/v17.0/112605838565124/messages'
            headers = {
                'Authorization': 'Bearer EAAEF7nFwsRoBAKuZC1ThcixZAfShD0mWwcKPtpZBHh9JfRKOLcNrwV2HnVgWwN5rzygHDX4mYRbY2TqZA5MVmad79cRZAKVGFJtIlG48mkUY6barPTeMhwxQpgBZAquwMGwurqo6gg6HqzO2gloreexkmjQDo8OJAUMxRkZA8ff074ZBAcijkTiE',
                'Content-Type': 'application/json'
            }
            payload = {
                "messaging_product": "whatsapp",
                "recipient_type": "individual",
                "to": "57"+celular,
                "type": "text",
                "text": {
                    "preview_url": False,
                    "body": mensaje
                }
            }

            response = requests.post(url, headers=headers, json=payload)

            # Obtener el contenido de la respuesta en formato JSON
            response_json = response.json()

            waId = response_json['contacts'][0]['wa_id']
            messageId = response_json['messages'][0]['id']

            nuevo_mensaje = Mensajeria(
                destinatario_id = destinatario.id,
                texto=mensaje,
                celular = waId,
                mensaje_id = messageId,
                created_by_id=user.id
            )

            nuevo_mensaje.save()

            # Retornar la respuesta como un JSON
            return JsonResponse(response_json)

@login_required()
def send_message_template(request):

    if request.method == 'POST':

        destinatarios = request.POST.getlist('destinatarios')  # Obtener una lista de los valores de destinatarios
        mensaje = request.POST.get('mensaje')
        data = {'destinatarios': destinatarios}  # Crear un diccionario con el valor de destinatarios
        user = request.user
        # user = User.objects.get(id=user.id)
        # return JsonResponse(data)
        for destinatario in destinatarios:

            destinatario = Destinatarios.objects.get(id=destinatario)
            celular = destinatario.persona.telefonomovil
            # return JsonResponse({'destinatario_id': })

            url = 'https://graph.facebook.com/v17.0/112605838565124/messages'
            headers = {
                'Authorization': 'Bearer EAAEF7nFwsRoBAKuZC1ThcixZAfShD0mWwcKPtpZBHh9JfRKOLcNrwV2HnVgWwN5rzygHDX4mYRbY2TqZA5MVmad79cRZAKVGFJtIlG48mkUY6barPTeMhwxQpgBZAquwMGwurqo6gg6HqzO2gloreexkmjQDo8OJAUMxRkZA8ff074ZBAcijkTiE',
                'Content-Type': 'application/json'
            }
            payload = {
                "messaging_product": "whatsapp",
                "to": "57"+celular,
                "type": "template",
                "template": {
                    "name": "hello_world",
                    "language": {
                        "code": "en_US"
                    }
                }
            }

            response = requests.post(url, headers=headers, json=payload)

            # Obtener el contenido de la respuesta en formato JSON
            response_json = response.json()

            waId = response_json['contacts'][0]['wa_id']
            messageId = response_json['messages'][0]['id']

            nuevo_mensaje = Mensajeria(
                destinatario_id = destinatario.id,
                texto=mensaje,
                celular = waId,
                mensaje_id = messageId,
                created_by_id=user.id
            )

            nuevo_mensaje.save()

            # Retornar la respuesta como un JSON
            return JsonResponse(response_json)

