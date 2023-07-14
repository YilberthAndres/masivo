from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos
from mensajeria.forms import ArchivosForm
import os
from datetime import datetime
from django.conf import settings
import pandas as pd
import json
from django.http import JsonResponse

@login_required(login_url='signin')
def index(request):

    # 
    contexto = {
        'titulo': 'Carga',
        # 'archivos': archivos,
    }
    return render(request, 'carga/index.html', contexto)



def uploaded(request):
    if request.method == 'POST' and 'archivo_excel' in request.FILES:
        archivo = request.FILES['archivo_excel']

        if archivo.name.endswith(('.xls', '.xlsx')):
            try:
                df = pd.read_excel(archivo, engine='openpyxl')
                matriz = df.values.tolist()

                # Devolver el arreglo como respuesta JSON
                return JsonResponse({'success': True}) 
            except Exception as e:
                # Manejar errores de lectura del archivo
                return JsonResponse({'error': 'Error al procesar el archivo: ' + str(e)})

    # Si no se recibió un archivo válido o no se procesó correctamente, devolver una respuesta de error
    return JsonResponse({'error': 'No se recibió un archivo válido.'})
