from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos
from mensajeria.forms import ArchivosForm
from django.http import HttpResponse
from datetime import datetime
import boto3
from django.core.files.storage import get_storage_class
import requests
import os
from django.conf import settings
import json
import dotenv
dotenv.load_dotenv()
import hashlib
import re


API_KEY_ENV                 = os.getenv('API_KEY')
ID_WHATSAPP_BUSINESS_ENV    = os.getenv('ID_WHATSAPP_BUSINESS')
ID_WHATSAPP_NUMBER_ENV      = os.getenv('ID_WHATSAPP_NUMBER')
API_VERSION_WHATSAPP_ENV    = os.getenv('API_VERSION_WHATSAPP')

@login_required(login_url="signin")
def index(request):
    #
    contexto = {
        "titulo": "Multimedia",
        # 'archivos': archivos,
    }
    return render(request, "multimedia/index.html", contexto)


@login_required(login_url="signin")
def create(request):
    contexto = {
        "titulo": "Agregar Multimedia",
    }
    return render(request, "multimedia/create.html", contexto)


def uploaded(request):
    if request.method == "POST":
        nombre = request.POST.get("nombre")
        archivo = request.FILES.get("archivo")

        s3 = boto3.resource(
            "s3",
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
        )
        bucket = s3.Bucket("masivo")
        s3_client = boto3.client(
            "s3",
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
        )

        url = ""

        try:
            bucket.put_object(Key=archivo.name, Body=archivo)
            response = s3_client.generate_presigned_url(
                "get_object",
                Params={"Bucket": "masivo", "Key": archivo.name},
            )
            url = response
        except Exception as e:
            return JsonResponse({"error": e})

        response = bucket.Object(archivo.name)

        nombre_archivo, extension = os.path.splitext(archivo.name)
        nombre_unico = datetime.now().strftime("%Y%m%d_%H%M%S")
        carpeta_destino = "archivos"
        user = request.user
        user = User.objects.get(id=user.id)
        form = ArchivosForm(request.POST)
        new_archivo = form.save(commit=False)
        new_archivo.formato = extension
        new_archivo.dir = url
        new_archivo.created_by = user

        new_archivo.save()

        # Define la ruta completa de destino del archivo
        ruta_destino = os.path.join(
            settings.STATIC_ROOT, carpeta_destino, f"{nombre_unico}{extension}"
        )

        # Guarda el archivo en la carpeta de destino
        with open(ruta_destino, "wb") as archivo_destino:
            for chunk in archivo.chunks():
                archivo_destino.write(chunk)

        # Obtener la extensión del archivo

        archivo_nombre, archivo_extension = os.path.splitext(archivo.name)

        return JsonResponse({"success": True})  # Envía una respuesta JSON exitosa

    return JsonResponse({"success": False})


def delete(request, archivo_id):
    if request.method == "POST":
        try:
            archivo = Archivos.objects.get(id=archivo_id)
            ruta_archivo = "mensajeria/static/" + archivo.dir
            borrar_archivo(ruta_archivo)

            registro = Archivos.objects.get(id=archivo_id)
            registro.delete()
            # Lógica adicional después de eliminar el registro
            return JsonResponse({"success": True})
        except Archivos.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({"success": False})


def list(request):
    if request.method == "POST":
        try:
            archivos = Archivos.objects.all()
            archivosnew = []

            for archivo in archivos:
                usuario = archivo.created_by
                archivoslist = {
                    "id": archivo.id,
                    "nombre": archivo.descripcion,
                    "tipo": archivo.tipo,
                    "dir": archivo.dir,
                    "created_at": archivo.created_at,
                    "nombre_usuario": usuario.username,
                }
                archivosnew.append(archivoslist)

            # Lógica adicional después de eliminar el registro
            return JsonResponse(archivosnew, safe=False)
        except Archivos.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({"success": False})


def borrar_archivo(ruta_archivo):
    if os.path.exists(ruta_archivo):
        os.remove(ruta_archivo)
        return True
    else:
        return False



def get_media(request):
    url = 'https://graph.facebook.com/'+API_VERSION_WHATSAPP_ENV+'/268127482508556'
    headers = {
        'Authorization': API_KEY_ENV,
        'Content-Type': 'application/json'
    }


    response = requests.get(url, headers=headers)
    response_json = response.json()

    url_media = response_json['url']

    response_media = requests.get(url_media, headers=headers)


    if response_media.status_code == 200:
        # Genera el nombre del archivo a partir de la URL usando un hash MD5
        nombre_archivo = hashlib.md5(url_media.encode()).hexdigest()

        # Obtiene la extensión del archivo desde el encabezado Content-Type
        extension_archivo = response_media.headers.get('Content-Type', '').split('/')[-1]

        # Elimina los caracteres inválidos para el nombre del archivo
        nombre_archivo = re.sub(r'[\\/*?:"<>|]', '', nombre_archivo)

        # Combina el nombre del archivo y su extensión
        nombre_archivo_con_extension = f"{nombre_archivo}.{extension_archivo}"

        # Construye la ruta completa para guardar el archivo en la carpeta deseada
        ruta_archivo = os.path.join(settings.BASE_DIR, "mensajeria", "static", "temp", nombre_archivo_con_extension)

        # Abre el archivo en modo binario y guarda el contenido de la respuesta en él
        with open(ruta_archivo, 'wb') as archivo:
            archivo.write(response_media.content)

        # Devuelve una respuesta con el enlace a la imagen descargada
        return HttpResponse(f"Imagen descargada y guardada en: {ruta_archivo}")
    else:
        return HttpResponse("Error al descargar la imagen", status=404)

    # return HttpResponse(response_media, content_type="image/jpeg")
    response_json_media = response.json()

    return JsonResponse(response_json_media)