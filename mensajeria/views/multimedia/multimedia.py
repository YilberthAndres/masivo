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


@login_required(login_url='signin')
def index(request):

    # 
    contexto = {
        'titulo': 'Multimedia',
        # 'archivos': archivos,
    }
    return render(request, 'multimedia/index.html', contexto)


@login_required(login_url='signin')
def create(request):
    
    contexto = {
        'titulo': 'Agregar Multimedia',
    }
    return render(request, 'multimedia/create.html', contexto)


def uploaded(request):
    if request.method == 'POST':
        
        nombre = request.POST.get('nombre')
        archivo = request.FILES.get('archivo')

        nombre_archivo, extension = os.path.splitext(archivo.name)
        nombre_unico = datetime.now().strftime("%Y%m%d_%H%M%S")
        carpeta_destino = 'archivos'
        user = request.user
        user = User.objects.get(id=user.id)
        form = ArchivosForm(request.POST)
        new_archivo            = form.save(commit=False)
        new_archivo.formato    = extension
        new_archivo.dir        = carpeta_destino +'/'+nombre_unico+''+extension
        new_archivo.created_by = user

        new_archivo.save()
        
        # Define la ruta completa de destino del archivo
        ruta_destino = os.path.join(settings.STATIC_ROOT, carpeta_destino, f'{nombre_unico}{extension}')

        # Guarda el archivo en la carpeta de destino
        with open(ruta_destino, 'wb') as archivo_destino:
            for chunk in archivo.chunks():
                archivo_destino.write(chunk)
        
        # Obtener la extensión del archivo
        
        archivo_nombre, archivo_extension = os.path.splitext(archivo.name)
        
        return JsonResponse({'success': True})  # Envía una respuesta JSON exitosa

    return JsonResponse({'success': False}) 



def delete(request, archivo_id):
    if request.method == 'POST':

        try:

            archivo = Archivos.objects.get(id=archivo_id)
            ruta_archivo = 'mensajeria/static/'+ archivo.dir
            borrar_archivo(ruta_archivo)

            registro = Archivos.objects.get(id=archivo_id)
            registro.delete()
            # Lógica adicional después de eliminar el registro
            return JsonResponse({'success': True})  
        except Archivos.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': False})  
        
def list(request):
    if request.method == 'POST':

        try:
            archivos = Archivos.objects.all()
            archivosnew = []

            for archivo in archivos:
                usuario = archivo.created_by
                archivoslist = {
                    'id': archivo.id,
                    'nombre': archivo.descripcion,
                    'tipo': archivo.tipo,
                    'dir': 'static/'+archivo.dir,
                    'created_at': archivo.created_at,
                    'nombre_usuario': usuario.username,
                }
                archivosnew.append(archivoslist)

           


            # Lógica adicional después de eliminar el registro
            return JsonResponse(archivosnew, safe=False)
        except Archivos.DoesNotExist:
            # Lógica en caso de que el registro no exista
            return JsonResponse({'success': False})  

def borrar_archivo(ruta_archivo):
    if os.path.exists(ruta_archivo):
        os.remove(ruta_archivo)
        return True
    else:
        return False