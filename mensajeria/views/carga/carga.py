from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos, Destinatarios
from mensajeria.forms import ArchivosForm
import os
from datetime import datetime
from django.conf import settings
import pandas as pd
import json
from django.http import HttpResponse
from openpyxl import Workbook

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

                errados = []
                duplicados = []

                user = request.user
                user = User.objects.get(id=user.id)

                for fila in matriz:
                    nombre = fila[0]
                    celular = fila[1]

                    celular = str(celular)
                    celular = celular.replace(" ", "")

                    
                    
                    if len(celular) == 10 and celular.startswith("3") and celular.isdigit():
                        if not Destinatarios.objects.filter(celular=celular).exists():
                            nuevo_registro = Destinatarios(nombre=nombre, celular=celular, created_by=user)
                            nuevo_registro.save()
                        else:
                            duplicados.append((nombre, celular))
                    else:
                        errados.append((nombre, celular))



                archivo_excel = generar_archivo_excel(errados, duplicados)

                with open(archivo_excel, "rb") as archivo:
                    response = HttpResponse(archivo.read(), content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
                    response["Content-Disposition"] = f"attachment; filename={archivo_excel}"
                    return response


                # Devolver el arreglo como respuesta JSON
                return JsonResponse({'success': True}) 
            except Exception as e:
                # Manejar errores de lectura del archivo
                return JsonResponse({'error': 'Error al procesar el archivo: ' + str(e)})

    # Si no se recibió un archivo válido o no se procesó correctamente, devolver una respuesta de error
    return JsonResponse({'error': 'No se recibió un archivo válido.'})

def generar_archivo_excel(errados, duplicados):
    # Crear un nuevo libro de trabajo de Excel
    workbook = Workbook()

    # Crear una hoja de cálculo para los registros errados
    hoja_errados = workbook.create_sheet(title="Errados")
    for registro in errados:
        hoja_errados.append(registro)

    # Crear una hoja de cálculo para los registros duplicados
    hoja_duplicados = workbook.create_sheet(title="Duplicados")
    for registro in duplicados:
        hoja_duplicados.append(registro)

    # Eliminar la hoja de cálculo por defecto "Sheet"
    del workbook["Sheet"]

    # Guardar el libro de trabajo en un archivo
    nombre_archivo = "registros.xlsx"
    workbook.save(nombre_archivo)

    # Devolver el nombre del archivo generado
    return nombre_archivo