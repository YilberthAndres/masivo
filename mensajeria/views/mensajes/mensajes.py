from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Destinatarios, Personas, Mensajeria, Archivos
import requests
from mensajeria.forms import ArchivosForm
import os
from django.conf import settings
from masivo.utils import agregar_tarea_dinamicamente
from datetime import datetime, timedelta
import uuid
from django.utils import timezone
from datetime import timedelta
from django.db.models import OuterRef, Subquery, Max, Count
from django.db import connection

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

@login_required(login_url="signin")
def index(request):
    contexto = {
        "titulo": "Multimedia",
        # 'archivos': archivos,
    }
    return render(request, "mensajes/index.html", contexto)


@login_required(login_url="signin")
def createRecordatorio(request):
    if request.method == "POST":
        asunto = request.POST.get("asunto")
        fecha = request.POST.get("fecha")
        texto = request.POST.get("texto")
        adjunto = request.POST.get("adjunto")

        nombre_tarea = str(uuid.uuid4())
        fecha_ejecucion = datetime.strptime(fecha, "%Y-%m-%dT%H:%M")
        fecha_terminacion = fecha_ejecucion + timedelta(days=1)

        tarea = agregar_tarea_dinamicamente(
            nombre_tarea, fecha_ejecucion, fecha_terminacion,
            texto,adjunto,asunto
        )

    return JsonResponse({"success": True})




@login_required(login_url="signin")
def mensajes(request):


    mensajes = Mensajeria.objects.all()


    contexto = {
        "titulo": "Mensajes",
        # 'archivos': archivos,
    }
    return render(request, "mensajes/view.html", contexto)


@login_required(login_url="signin")
def obtener_mensajes(request):
    if request.method == "POST":
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT 
                    m1.recipiente_id,  
                    m1.texto, 
                    DATE_FORMAT(FROM_UNIXTIME(m1.timestamp_w), '%Y-%m-%d') AS fecha,
                    DATE_FORMAT(FROM_UNIXTIME(m1.timestamp_w), '%H:%i') AS hora,
                    CONCAT(p.nombre, ' ', p.segundonombre, ' ', p.apellido) as nombre
                FROM mensajeria m1
                INNER JOIN personas p ON (m1.recipiente_id = p.telefonowhatsapp)
                INNER JOIN (
                    SELECT recipiente_id, MAX(created_at) AS max_created_at
                    FROM mensajeria
                    WHERE created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK) 
                    GROUP BY recipiente_id
                ) m2 ON m1.recipiente_id = m2.recipiente_id AND m1.created_at = m2.max_created_at
                WHERE m1.created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK) 
                GROUP BY m1.recipiente_id, m1.texto, m1.timestamp_w, p.nombre, p.segundonombre, p.apellido, m1.destinatario_id
                ORDER BY m1.timestamp_w DESC;
            """)
            rows = cursor.fetchall()

        resultados = []
        for row in rows:
            recipiente_id   = row[0]
            texto           = row[1]
            fecha           = row[2]
            hora            = row[3]
            nombre          = row[4]

            resultado = {
                'recipiente_id':    recipiente_id,
                'texto':            texto,
                'fecha':            fecha,
                'hora':             hora,
                'nombre':           nombre,
            }
            resultados.append(resultado)


        # Devolver la respuesta JSON
        return JsonResponse(resultados, safe=False)
    

@login_required(login_url="signin")
def obtener_mensajes_find(request, recipiente_id):
    if request.method == "POST":
        
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT 
                    estado_id, 
                    recipiente_id,
                    CASE
                        WHEN created_by_id IS NULL THEN 'recibido'
                        ELSE 'enviado'
                END AS estado,
                DATE_FORMAT(FROM_UNIXTIME(timestamp_w), '%%Y-%%m-%%d') AS fecha,
                DATE_FORMAT(FROM_UNIXTIME(timestamp_w), '%%H:%%i') AS hora, 
                texto,
                id
                FROM mensajeria
                WHERE  recipiente_id = '%s' and created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK)
            """, [recipiente_id])

            rows = cursor.fetchall()
        # return JsonResponse({'Hola': 'perros'}, safe=False)
        resultados = []
        for row in rows:
            estado_id       = row[0]
            recipiente_id   = row[1]
            estado          = row[2]
            fecha           = row[3]
            hora            = row[4]
            texto           = row[5]
            mensaje_id      = row[6]

            resultado = {
                'estado_id':        estado_id,
                'recipiente_id':    recipiente_id,
                'estado':           estado,
                'fecha':            fecha,                
                'hora':             hora,
                'texto':            texto,
                'mensaje_id':       mensaje_id,
            }
            resultados.append(resultado)


        # Devolver la respuesta JSON
        return JsonResponse(resultados, safe=False)


@login_required()
def send_message(request):
    if request.method == 'POST':
        data = json.loads(request.body) # Parsear el cuerpo de la solicitud como JSON
        destinatario = data.get('destinatario')  
        mensaje = data.get('mensaje')
        user = request.user
        # user = User.objects.get(id=user.id)
        # return JsonResponse(data)
        # return JsonResponse(data)
        # for destinatario in destinatarios:

        
        persona_model       =   Personas.objects.get(telefonowhatsapp=destinatario)
        destinatario_model  =   Destinatarios.objects.get(persona_id = persona_model.id)
        celular = destinatario_model.persona.telefonomovil

        url = 'https://graph.facebook.com/'+API_VERSION_WHATSAPP_ENV+'/'+ID_WHATSAPP_NUMBER_ENV+'/messages'
        headers = {
            'Authorization': API_KEY_ENV,
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
            destinatario_id     =   destinatario_model.id,
            texto               =   mensaje,
            celular             =   waId,
            mensaje_id          =   messageId,
            created_by_id       =   user.id
        )

        nuevo_mensaje.save()

        resultadoMensaje = {
                'mensaje_id':    nuevo_mensaje.id,
                'texto':            nuevo_mensaje.texto,
                # 'fecha':            fecha,
                # 'hora':             hora,
                # 'nombre':           nombre,
            }

            # Retornar la respuesta como un JSON
        return JsonResponse(resultadoMensaje)
        # Retornar la respuesta como un JSON
        # return JsonResponse(response_json)