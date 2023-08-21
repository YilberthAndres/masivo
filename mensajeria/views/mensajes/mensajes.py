from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Destinatarios, Personas, Mensajeria, Archivos, Conversaciones
import requests
from django.core.exceptions import ObjectDoesNotExist
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
from django.db.models import Count, Case, When, Value, CharField
from django.db.models.functions import TruncDate
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

        filtro = request.GET.get("filtro")
        
        
        if filtro != '':
            filtro_completo = " AND (CONCAT(p.nombre, ' ', p.segundonombre, ' ', p.apellido) LIKE %s OR p.telefonowhatsapp LIKE %s)"
            filtro_values = ['%' + filtro + '%', '%' + filtro + '%']
        else: 
            estado = request.GET.get("estado")
            filtro_completo = " and c.estado_id = %s "
            filtro_values = estado 

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT 
                    m1.recipiente_id,  
                    m1.texto, 
                    DATE_FORMAT(FROM_UNIXTIME(m1.timestamp_w), '%%Y-%%m-%%d') AS fecha,
                    DATE_FORMAT(FROM_UNIXTIME(m1.timestamp_w), '%%H:%%i') AS hora,
                    CONCAT(p.nombre, ' ', p.segundonombre, ' ', p.apellido) as nombre,
                    (
                        SELECT COUNT(*)
                        FROM mensajeria m2
                        WHERE m2.recipiente_id = m1.recipiente_id
                        AND m2.destinatario_id IS NULL
                        AND m2.estado_id = 745
                    ) as cantidad_mensajes_destinatario_null_estado_745,
                    c.estado_id
                FROM mensajeria m1
                INNER JOIN personas p ON (m1.recipiente_id = p.telefonowhatsapp)
                INNER JOIN (
                    SELECT recipiente_id, MAX(created_at) AS max_created_at
                    FROM mensajeria
                    WHERE created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK) 
                    GROUP BY recipiente_id
                ) m2 ON m1.recipiente_id = m2.recipiente_id AND m1.created_at = m2.max_created_at
                inner join destinatarios d on (d.persona_id = p.id)
                inner join conversaciones c on (c.destinatario_id = d.id )
                WHERE m1.created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK) 
                """ + filtro_completo + """
                GROUP BY m1.recipiente_id, m1.texto, m1.timestamp_w, p.nombre, p.segundonombre, p.apellido, m1.destinatario_id
                ORDER BY m1.timestamp_w DESC;
            """, filtro_values)

            
            rows = cursor.fetchall()


        resultados = []
        for row in rows:
            
            recipiente_id   = row[0]
            texto           = row[1]
            fecha           = row[2]
            hora            = row[3]
            nombre          = row[4]
            sin_leer        = row[5]
            estado_id       = row[6]

            resultado = {
                'recipiente_id':    recipiente_id,
                'texto':            texto,
                'fecha':            fecha,
                'hora':             hora,
                'nombre':           nombre,
                'sin_leer':         sin_leer,
                'estado_id':        estado_id,
            }
            resultados.append(resultado)


        # Devolver la respuesta JSON
        return JsonResponse(resultados, safe=False)
    

@login_required(login_url="signin")
def obtener_mensajes_find(request, recipiente_id):
    if request.method == "POST":
        mensajes = Mensajeria.objects.filter(
            recipiente_id=recipiente_id,
            created_at__gte=timezone.now() - timezone.timedelta(weeks=2)
        ).annotate(
            estado_annotation=Case(
                When(created_by_id__isnull=True, then=Value('recibido')),
                default=Value('enviado'),
                output_field=CharField()
            ),
            fecha=TruncDate('created_at')
        ).values('estado_annotation', 'recipiente_id', 'fecha', 
                 'estado_id', 'timestamp_w', 'texto', 'mensaje_id', 
                 'mime_type', 'link', 'filename', 'voice', 'id').annotate(
            cantidad_registros=Count('id')
        ).order_by('fecha')

        resultados = {}
        for mensaje in mensajes:
            # fecha = mensaje['fecha'].strftime('%Y-%m-%d')
            fecha_int = float(mensaje['timestamp_w'])
            fecha_datetime = timezone.datetime.fromtimestamp(fecha_int)
            fecha = fecha_datetime.strftime('%Y/%m/%d')


            timestamp = float(mensaje['timestamp_w'])
            fecha_hora = datetime.fromtimestamp(timestamp)
            hora = fecha_hora.strftime('%H')
            minutos = fecha_hora.strftime('%M')
            hora_completa = hora + ':' + minutos


            if fecha not in resultados:
                resultados[fecha] = []
            resultados[fecha].append({
                'estado': mensaje['estado_annotation'],
                'recipiente_id': mensaje['recipiente_id'],
                'fecha': fecha,
                'id': mensaje['id'],
                'estado_id': mensaje['estado_id'],
                'texto': mensaje['texto'],
                'mensaje_id': mensaje['mensaje_id'],
                'mime_type': mensaje['mime_type'],
                'dir': mensaje['link'],
                'filename': mensaje['filename'],
                'voice': mensaje['voice'],
                'hora': hora_completa
            })

        now = timezone.now()
        limite_tiempo = now - timedelta(hours=24)

        registros = Mensajeria.objects.filter(
            recipiente_id= recipiente_id,
            created_at__gte=limite_tiempo
        )

        cantidad_registros = True
        if(registros.count() <= 0 ):
            cantidad_registros = False

        # Devolver la respuesta JSON
        response_data = {
        "resultados": resultados,
        "chat_view": cantidad_registros
        }

   
    return JsonResponse(response_data)

        # return JsonResponse(resultados, safe=False)
    
        #         estado_id       = row[0]
    #         recipiente_id   = row[1]
    #         estado          = row[2]
    #         fecha           = row[3]
    #         hora            = row[4]
    #         texto           = row[5]
    #         mensaje_id      = row[6]
    #         mime_type       = row[7]
    #         link            = row[8]
    #         filename        = row[9]
    #         voice           = row[10]
    # if request.method == "POST":
        
    #     with connection.cursor() as cursor:
    #         cursor.execute("""
    #             SELECT 
    #                 estado_id, 
    #                 recipiente_id,
    #                 CASE
    #                     WHEN created_by_id IS NULL THEN 'recibido'
    #                     ELSE 'enviado'
    #             END AS estado,
    #             DATE_FORMAT(FROM_UNIXTIME(timestamp_w), '%%Y-%%m-%%d') AS fecha,
    #             DATE_FORMAT(FROM_UNIXTIME(timestamp_w), '%%H:%%i') AS hora, 
    #             texto,
    #             id,
    #             mime_type,
    #             link,
    #             filename,
    #             voice
    #             FROM mensajeria
    #             WHERE  recipiente_id = '%s' and created_at >= DATE_SUB(NOW(), INTERVAL 2 WEEK)
    #         """, [recipiente_id])

    #         rows = cursor.fetchall()
    #     # return JsonResponse({'Hola': 'perros'}, safe=False)
    #     resultados = []
    #     for row in rows:
    #         estado_id       = row[0]
    #         recipiente_id   = row[1]
    #         estado          = row[2]
    #         fecha           = row[3]
    #         hora            = row[4]
    #         texto           = row[5]
    #         mensaje_id      = row[6]
    #         mime_type       = row[7]
    #         link            = row[8]
    #         filename        = row[9]
    #         voice           = row[10]

    #         resultado = {
    #             'estado_id':        estado_id,
    #             'recipiente_id':    recipiente_id,
    #             'estado':           estado,
    #             'fecha':            fecha,                
    #             'hora':             hora,
    #             'texto':            texto,
    #             'id':               mensaje_id,
    #             'mime_type':        mime_type,
    #             'dir':              link,
    #             'filename':         filename,
    #             'voice':            voice,
    #         }
    #         resultados.append(resultado)


    #     now = timezone.now()
    #     limite_tiempo = now - timedelta(hours=24)

    #     registros = Mensajeria.objects.filter(
    #         recipiente_id= recipiente_id,
    #         created_at__gte=limite_tiempo
    #     )

    #     cantidad_registros = True
    #     if(registros.count() <= 0 ):
    #         cantidad_registros = False

    #     # Devolver la respuesta JSON
    #     response_data = {
    #     "resultados": resultados,
    #     "chat_view": cantidad_registros
    #     }

    # # Devolver una respuesta JSON con el diccionario como contenido
    # return JsonResponse(response_data)


@login_required()
def send_message(request):
    if request.method == 'POST':
        data = json.loads(request.body) # Parsear el cuerpo de la solicitud como JSON
        destinatario = data.get('destinatario')  
        mensaje = data.get('mensaje')
        user = request.user
        
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

        try:
            envia_id = destinatario_model.id
            conversacion = Conversaciones.objects.get(destinatario_id=envia_id)
            conversacion.estado_id       = 758
            conversacion.save()

            conversacion_id = conversacion.id
        except ObjectDoesNotExist:
            conversacion = Conversaciones(
                destinatario_id = envia_id,
                created_by_id=1, estado_id=758
            )
            conversacion.save()
            conversacion_id = conversacion.id

        waId = response_json['contacts'][0]['wa_id']
        messageId = response_json['messages'][0]['id']

        nuevo_mensaje = Mensajeria(
            destinatario_id     =   destinatario_model.id,
            texto               =   mensaje,
            celular             =   waId,
            recipiente_id       =   waId,
            mensaje_id          =   messageId,
            conversacion_id     =   conversacion_id,
            created_by_id       =   user.id
        )

        nuevo_mensaje.save()

        resultadoMensaje = {
                'id':    nuevo_mensaje.id,
                'texto':            nuevo_mensaje.texto,
                'destinatario':       waId,
                # 'hora':             '1690133734',
                'mime_type':           '',
                'dir':           ''
                # 'fecha':            fecha,
                # 'hora':             hora,
                # 'nombre':           nombre,
            }

            # Retornar la respuesta como un JSON
        return JsonResponse(resultadoMensaje)
        # Retornar la respuesta como un JSON
        # return JsonResponse(response_json)

import re
import hashlib

def clean_filename(filename):
    # Remueve caracteres inválidos para nombres de archivo, excepto letras, números y guiones bajos
    cleaned_filename = re.sub(r'[^\w.-]', '', filename)
    return cleaned_filename

@login_required()
def send_message_media(request):
    if request.method == 'POST':
        
        destinatario    = request.POST.get('destinatario')
        tipo            = request.POST.get('tipo')
        archivo         = request.FILES.get('archivo')

        nombre_archivo, extension = os.path.splitext(archivo.name)
        nombre_unico = datetime.now().strftime("%Y%m%d_%H%M%S")
        carpeta_destino = 'temp'
        user = request.user

        ruta_destino = os.path.join(settings.STATIC_ROOT, carpeta_destino, f'{nombre_unico}{extension}')

        # Guarda el archivo en la carpeta de destino
        with open(ruta_destino, 'wb') as archivo_destino:
            for chunk in archivo.chunks():
                archivo_destino.write(chunk)
        
        # Obtener la extensión del archivo
        
        archivo_nombre, archivo_extension = os.path.splitext(archivo.name)
        nombre_completo = nombre_unico+''+archivo_extension
        dir = 'static/'+carpeta_destino +'/'+nombre_unico+''+extension

    try:
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
            "to": "57"+celular,
            "type": tipo,
            ""+tipo+"": {
                "link": "https://86bd-186-86-181-231.ngrok-free.app/static/temp/"+nombre_completo
            }
        }

        link_img = "https://86bd-186-86-181-231.ngrok-free.app/static/temp/"+nombre_completo
        response = requests.post(url, headers=headers, json=payload)

        # Obtener el contenido de la respuesta en formato JSON
        response_json = response.json()
        


        try:
            envia_id = destinatario_model.id
            conversacion = Conversaciones.objects.get(destinatario_id=envia_id)
            conversacion.estado_id       = 758
            conversacion.save()

            conversacion_id = conversacion.id
        except ObjectDoesNotExist:
            conversacion = Conversaciones(
                destinatario_id = envia_id,
                created_by_id=1, estado_id=758
            )
            conversacion.save()
            conversacion_id = conversacion.id
        

        waId = response_json['contacts'][0]['wa_id']
        messageId = response_json['messages'][0]['id']

        
        if(tipo == 'image'):
            mime_type = 'image/jpeg'
        elif(tipo == 'video'):
            mime_type = 'video/mp4'
        elif(tipo == 'audio'):
            mime_type = 'audio/mpeg'
        elif(tipo == 'document'):
            mime_type = 'document'
        

        nuevo_mensaje = Mensajeria(
            destinatario_id     =   destinatario_model.id,
            celular             =   waId,
            recipiente_id       =   waId,
            link                =   dir,
            mensaje_id          =   messageId,
            mime_type           =   mime_type,
            filename            =   nombre_completo,
            conversacion_id     =   conversacion_id,
            created_by_id       =   user.id
        )

        nuevo_mensaje.save()
        return JsonResponse({'status':200, 'file':{'id':nuevo_mensaje.id,'dir':dir, 'mime_type':tipo, 'filename':nombre_completo}})


    except Exception as e:
        error_message = str(e)
        return JsonResponse({'status':400, 'message':error_message})

    return JsonResponse({'status':404, 'message':'Metodo no valido'})
        




@login_required()
def messages_read(request, recipiente_id):

    try:
        Mensajeria.objects.filter(destinatario_id__isnull=True, recipiente_id=recipiente_id).update(estado_id=746)
        response_data = {'success': True, 'message': 'Operación exitosa.'}

    except Exception as e:
        error_message = str(e)
            # Lógica en caso de que el registro no exista
        response_data = {'success': False, 'message': error_message}
    
    # Retorna una respuesta JSON con el diccionario
    return JsonResponse(response_data)

@login_required()
def find_archivar(request):
    try:
        destinatario_ws = request.GET.get("destinatario_ws")
        estado_id       = request.GET.get("estado_id")
        
        persona = Personas.objects.get(telefonowhatsapp=destinatario_ws )
        persona_id = persona.id
        
        envia   = Destinatarios.objects.get(persona_id=persona_id)
        envia_id = envia.id
        

        try:
            conversacion = Conversaciones.objects.get(destinatario_id=envia_id)
            conversacion_id = conversacion.id
            # response_data = {'success': False, 'conversacion': conversacion_id, 'estado_id': estado_id}
            # return JsonResponse(response_data)
            if(estado_id == "758"):
                conversacion.estado_id  = 759
                conversacion.save()
            elif(estado_id == "759"):
                conversacion.estado_id  = 758
                conversacion.save()
            

            response_data = {'success': True, 'message': 'Exito.'}
        except ObjectDoesNotExist:
            response_data = {'success': False, 'message': 'Ocurrio un error al actualizar conversacion.'}
        

    except Exception as e:
        error_message = str(e)
            # Lógica en caso de que el registro no exista
        response_data = {'success': False, 'message': error_message}
    
    # Retorna una respuesta JSON con el diccionario
    return JsonResponse(response_data)
    


