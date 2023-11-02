from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos, Destinatarios, Personas
from mensajeria.forms import ArchivosForm
import os
from datetime import datetime
from django.conf import settings
import pandas as pd
import json
from django.http import HttpResponse
from openpyxl import Workbook

@login_required(login_url="signin")
def index(request):
    #
    contexto = {
        "titulo": "Carga",
        # 'archivos': archivos,
    }
    return render(request, "carga/index.html", contexto)


def uploaded(request):
    if request.method == "POST" and "archivo_excel" in request.FILES:
        archivo = request.FILES["archivo_excel"]

        if archivo.name.endswith((".xls", ".xlsx")):
            try:
                df = pd.read_excel(archivo, engine="openpyxl")
                matriz = df.values.tolist()

                errados = []
                duplicados = []

                user = request.user
                user = User.objects.get(id=user.id)

                for fila in matriz:
                    nombre = fila[0]
                    celular = fila[1]

                    if(nombre !=  ''):
                        resultado = dividir_nombre(nombre)
                        if(resultado != 'error'):
                            if "primer_nombre" in resultado:
                                primer_nombre = resultado["primer_nombre"]
                            else:
                                primer_nombre = None

                            if "segundo_nombre" in resultado:
                                segundo_nombre = resultado["segundo_nombre"]
                            else:
                                segundo_nombre = None

                            if "primer_apellido" in resultado:
                                primer_apellido = resultado["primer_apellido"]
                            else:
                                primer_apellido = None

                            if "segundo_apellido" in resultado:
                                segundo_apellido = resultado["segundo_apellido"]
                            else:
                                segundo_apellido = None
                    else: 
                        primer_nombre = ""


                    celular = str(celular)
                    celular = celular.replace(" ", "")

                    if (
                        len(celular) == 10
                        and celular.startswith("3")
                        and celular.isdigit()
                        and primer_nombre != ""
                        and resultado != 'error'
                    ):
                        if not Personas.objects.filter(telefonomovil=celular).exists():

                            celular_w = '57'+ celular
                            nueva_persona = Personas(
                                nombre=primer_nombre,
                                segundonombre=segundo_nombre,
                                apellido=primer_apellido,
                                segundoapellido=segundo_apellido,
                                telefonomovil=celular,
                                telefonowhatsapp=celular_w,
                                created_by=user
                            )

                            nueva_persona.save()
                            persona_id = nueva_persona.id

                            nuevo_registro = Destinatarios(
                                persona_id=persona_id, created_by=user, estado_id=596
                            )
                            nuevo_registro.save()
                        else:
                            duplicados.append((nombre, celular))
                    else:
                        errados.append((nombre, celular))
                # return JsonResponse({"errados":errados, "duplicados": duplicados, "success": True})
                archivo_excel = generar_archivo_excel(errados, duplicados)
                
                with open(archivo_excel, "rb") as archivo:
                    response = HttpResponse(
                        archivo.read(),
                        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    )
                    response[
                        "Content-Disposition"
                    ] = f"attachment; filename={archivo_excel}"
                    return response

                # Devolver el arreglo como respuesta JSON
                
            except Exception as e:
                # Manejar errores de lectura del archivo
                return JsonResponse(
                    {"error": "Error al procesar el archivo: " + str(e)}
                )

    # Si no se recibió un archivo válido o no se procesó correctamente, devolver una respuesta de error
    return JsonResponse({"error": "No se recibió un archivo válido."})


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


def dividir_nombre(nombre):
    # Verificar si 'nombre' es None o una cadena vacía
    if not nombre:
        return {"error": 'El parámetro "nombre" es requerido'}

    # Eliminar posibles espacios en blanco al inicio y al final de la variable
    try:
        nombre = nombre.strip()
    except:
        return "error"

    # Eliminar posibles dobles espacios en blanco
    nombre = " ".join(nombre.split())

    # Dividir la variable en función de las palabras
    partes = nombre.split()

    # Verificar la cantidad de palabras y asignarlas a las variables correspondientes
    if len(partes) >= 4:
        primer_nombre = partes[0].capitalize()
        segundo_nombre = partes[1].capitalize()
        primer_apellido = partes[2].capitalize()
        segundo_apellido = partes[3].capitalize()
    elif len(partes) == 3:
        primer_nombre = partes[0].capitalize()
        segundo_nombre = ""
        primer_apellido = partes[1].capitalize()
        segundo_apellido = partes[2].capitalize()
    elif len(partes) == 2:
        primer_nombre = partes[0].capitalize()
        segundo_nombre = ""
        primer_apellido = partes[1].capitalize()
        segundo_apellido = ""  # No hay segundo apellido en este caso
    else:
        primer_nombre = nombre.capitalize()
        segundo_nombre = ""
        primer_apellido = ""  # No hay apellido en este caso
        segundo_apellido = ""  # No hay segundo apellido en este caso

    # Crear un diccionario con los valores obtenidos
    resultado = {
        "primer_nombre": primer_nombre,
        "segundo_nombre": segundo_nombre,
        "primer_apellido": primer_apellido,
        "segundo_apellido": segundo_apellido,
    }

    return resultado
