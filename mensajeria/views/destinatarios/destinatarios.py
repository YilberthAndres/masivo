from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Destinatarios
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
                destinatarioslist = {
                    'id': destinatario.id,
                    'nombre': destinatario.nombre,
                    'celular': destinatario.celular,
                    'created_at': destinatario.created_at,
                    'nombre_usuario': usuario.username,
                }
                destinatariosnew.append(destinatarioslist)

           


            # Lógica adicional después de eliminar el registro
            return JsonResponse(destinatariosnew, safe=False)
        except destinatarios.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': False})  