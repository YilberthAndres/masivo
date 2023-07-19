from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos
from mensajeria.forms import ArchivosForm
import os
from django.conf import settings
from masivo.utils import agregar_tarea_dinamicamente
from datetime import datetime, timedelta
import uuid


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
    contexto = {
        "titulo": "Mensajes",
        # 'archivos': archivos,
    }
    return render(request, "mensajes/view.html", contexto)