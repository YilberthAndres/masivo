from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Destinatarios, Personas
import os
from datetime import datetime
from django.conf import settings


@login_required(login_url='signin')
def index(request):

    destinatarios = Destinatarios.objects.all()
    contexto = {
        'titulo': 'Destinatarios',
        'destinatarios': destinatarios,
    }
    return render(request, 'destinatarios/index.html', contexto)

@login_required(login_url='signin')
def list(request):
    if request.method == 'POST':

        try:

            
            destinatarios = Destinatarios.objects.all()
            destinatariosnew = []
              
            for destinatario in destinatarios:
                usuario = destinatario.created_by
                persona = destinatario.persona

                
                nombre_persona = persona.nombre + ' ' + persona.segundonombre + ' ' + persona.apellido + ' ' + persona.segundoapellido
                destinatarioslist = {
                    'id': destinatario.id,
                    'nombre': nombre_persona,
                    'celular': persona.telefonomovil,
                    'estado': destinatario.estado_id,
                    # 'created_at': destinatario.created_at,
                    # 'nombre_usuario': usuario.username,
                }
                destinatariosnew.append(destinatarioslist)

           


            # Lógica adicional después de eliminar el registro
            return JsonResponse(destinatariosnew, safe=False)
        except Exception as e:
            error_message = str(e)
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': error_message})  
            # Lógica en caso de que el registro no exista
        
def delete(request, destinatario_id):
    if request.method == 'POST':

        try:
            # destinatario = Destinatarios.objects.get(id=destinatario_id)
            # destinatario.delete()
            destinatario = Destinatarios.objects.get(id=destinatario_id)
            destinatario.estado_id = 597
            destinatario.save()
            # Lógica adicional después de eliminar el registro
            return JsonResponse({'success': True})  
        except Destinatarios.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': False})  