from django.db import models
from django.contrib.auth.models import User, Group
from .models import *
# Create your models here.


class Maestras(models.Model):
    id                = models.AutoField(primary_key=True)
    codigo            = models.CharField(max_length=200, null=True)
    nombre            = models.CharField(max_length=200)
    padre             = models.ForeignKey('self', on_delete=models.CASCADE, null=True)
    jerarquia         = models.IntegerField( null=True)
    orden             = models.IntegerField(null=True)
    visible           = models.IntegerField(null=True)
    observacion       = models.CharField(max_length=200, null=True)
    created_by        = models.ForeignKey('auth.User', related_name='maestras_created_by', on_delete=models.CASCADE)
    created_at        = models.DateTimeField(auto_now_add=True)
    updated_by        = models.ForeignKey('auth.User', related_name='maestras_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = models.DateTimeField(auto_now=True, null=True)
    deleted_at = models.DateTimeField(null=True, blank=True)
    deleted_by = models.BigIntegerField(null=True, blank=True)

    class Meta:
        db_table = 'maestras'
        verbose_name = 'maestra'
        verbose_name_plural = 'maestras'

class Personas(models.Model):
    identificacion = models.CharField(max_length=50, null=True,blank=True, verbose_name='Identificacion')
    lugarexpedicion = models.CharField(max_length=50, null=True, blank=True, verbose_name='lugar de expedición')
    fechaexpedicion = models.DateField(null=True, blank=True, verbose_name='Fehca de expedición')
    direccion = models.CharField(max_length=150, null=True, blank=True, verbose_name='Direccion')
    telefono = models.CharField(max_length=50, null=True, blank=True, verbose_name='Telefono fijo')
    telefonomovil = models.CharField(max_length=10, blank=True, verbose_name='Telefono movil', unique=True)
    telefonowhatsapp = models.CharField(max_length=50, null=True, blank=True, unique=True)
    email = models.CharField(max_length=50, null=True, blank=True, verbose_name='Email')
    sendemail = models.BooleanField(default=False,null=True, verbose_name='Enviar email')
    fechanacimiento = models.DateField(null=True, blank=True, verbose_name='Fecha nacmiento')
    nombre = models.CharField(max_length=50, blank=True, verbose_name='nombre')
    segundonombre = models.CharField(max_length=50, null=True, blank=True, verbose_name='segundo nombre')
    apellido = models.CharField(max_length=50, blank=True, verbose_name='apellido')
    segundoapellido = models.CharField(max_length=50, null=True, blank=True, verbose_name='segundo apellido')
    foto = models.TextField(null=True, blank=True)
    pais = models.ForeignKey(Maestras, null=True, blank=True, related_name='personas_pais', on_delete=models.CASCADE, db_index=True)
    departamento = models.ForeignKey(Maestras, null=True, blank=True, related_name='personas_departamento', on_delete=models.CASCADE, db_index=True)
    ciudad = models.ForeignKey(Maestras, null=True, blank=True, related_name='personas_ciudad', on_delete=models.CASCADE, db_index=True)
    zona = models.ForeignKey(Maestras, null=True, blank=True, related_name='personas_zona', on_delete=models.CASCADE, db_index=True)
    barrio = models.CharField(max_length=100, null=True, blank=True)
    tipoidentificacion = models.ForeignKey(Maestras, blank=True, null=True,related_name='personas_tipoidentificacion', on_delete=models.CASCADE, db_index=True)
    sexo = models.ForeignKey(Maestras,  blank=True,null=True, related_name='personas_sexo', on_delete=models.CASCADE, db_index=True)
    ocupacion = models.ForeignKey(Maestras, null=True, blank=True, related_name='personas_ocupacion', on_delete=models.CASCADE, db_index=True)
    observaciones = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    created_by = models.ForeignKey('auth.User', related_name='personas_created_by', on_delete=models.CASCADE)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)
    updated_by = models.ForeignKey('auth.User', related_name='personas_updated_by', null=True, on_delete=models.CASCADE)
    deleted_at = models.DateTimeField(null=True, blank=True)
    deleted_by = models.BigIntegerField(null=True, blank=True)

    class Meta:
        db_table = 'personas'
        verbose_name = 'persona'
        verbose_name_plural = 'personas'


class Archivos(models.Model):
    nombre            = models.CharField(max_length=650)
    descripcion       = models.TextField(blank=True)
    tipo              = models.CharField(max_length=50)
    formato           = models.CharField(max_length=50)
    dir               = models.CharField(max_length=500)
    created_by        = models.ForeignKey('auth.User', related_name='Archivos_created_by', on_delete=models.CASCADE)
    created_at        = models.DateTimeField(auto_now_add=True)
    updated_by        = models.ForeignKey('auth.User', related_name='Archivos_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'archivos'
        verbose_name = 'archivos'
        verbose_name_plural = 'archivos'



class Destinatarios(models.Model):
    persona           = models.ForeignKey(Personas, null=True, blank=True, related_name='Personas_destinatarios_persona', on_delete=models.CASCADE, db_index=True, unique=True)
    estado            = models.ForeignKey(Maestras, blank=True, null=True,related_name='destinatario_estado', on_delete=models.CASCADE, db_index=True)
    created_by        = models.ForeignKey('auth.User', related_name='Destinatarios_created_by', on_delete=models.CASCADE)
    created_at        = models.DateTimeField(auto_now_add=True)
    updated_by        = models.ForeignKey('auth.User', related_name='Destinatarios_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'destinatarios'
        verbose_name = 'destinatarios'
        verbose_name_plural = 'destinatarios'




class Conversaciones(models.Model):
    destinatario      = models.ForeignKey(Destinatarios, null=True, blank=True, related_name='Conversaciones_destinatarios', on_delete=models.CASCADE, db_index=True, unique=True)
    estado            = models.ForeignKey(Maestras, blank=True, null=True,related_name='Conversaciones_estado', on_delete=models.CASCADE, db_index=True)
    created_by        = models.ForeignKey('auth.User', related_name='Conversaciones_created_by', on_delete=models.CASCADE)
    created_at        = models.DateTimeField(auto_now_add=True)
    updated_by        = models.ForeignKey('auth.User', related_name='Conversaciones_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'conversaciones'
        verbose_name = 'conversaciones'
        verbose_name_plural = 'conversaciones'


class Mensajeria(models.Model):
    mensaje_id        = models.CharField(null=True, blank=True,max_length=100)
    recipiente_id     = models.CharField(null=True, blank=True,max_length=100)
    conversacion      = models.ForeignKey(Conversaciones, null=True, blank=True, related_name='Mensajeria_conversaciones', on_delete=models.CASCADE, db_index=True)
    destinatario      = models.ForeignKey(Destinatarios, null=True, blank=True, related_name='Mensajeria_destinatarios', on_delete=models.CASCADE, db_index=True)
    origin            = models.CharField(null=True, blank=True,max_length=100)
    tipo              = models.ForeignKey(Maestras, blank=True, related_name='mensajeria_tipo', null=True, on_delete=models.CASCADE, db_index=True)
    texto             = models.TextField(null=True, blank=True)
    multimedia_id     = models.CharField(null=True, blank=True,max_length=100)
    mime_type         = models.CharField(null=True, blank=True,max_length=100)
    sha256            = models.TextField(null=True, blank=True)
    link              = models.TextField(null=True, blank=True)
    filename          = models.TextField(null=True, blank=True)
    context_id        = models.TextField(null=True, blank=True)
    context_from      = models.CharField(null=True, blank=True,max_length=25)
    timestamp_w       = models.CharField(null=True, blank=True,max_length=100)
    celular           = models.CharField(null=True, blank=True,max_length=12)
    voice             = models.CharField(null=True, blank=True,max_length=12)
    estado            = models.ForeignKey(Maestras, blank=True, related_name='mensajeria_estado', null=True, on_delete=models.CASCADE, db_index=True)
    created_by        = models.ForeignKey('auth.User', related_name='mensajeria_created_by', null=True, blank=True, on_delete=models.CASCADE)
    created_at        = models.DateTimeField(auto_now_add=True , blank=True,)
    updated_by        = models.ForeignKey('auth.User', related_name='mensajeria_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = models.DateTimeField(auto_now=True , blank=True,)

    class Meta:
        db_table = 'mensajeria'
        verbose_name = 'mensajeria'
        verbose_name_plural = 'mensajeria'


class Modulos(models.Model):
    name = models.CharField(max_length=191, null=True, blank=True)
    path = models.CharField(max_length=191, null=True, blank=True)
    icon = models.CharField(max_length=191, null=True, blank=True)
    dad = models.ForeignKey('Modulos', related_name='modulos_children', null=True,on_delete=models.CASCADE)
    order = models.IntegerField(null=True, blank=True)
    estado    = models.ForeignKey(Maestras, null=True, blank=True, related_name='modulos_estado', on_delete=models.CASCADE, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True )
    created_by = models.ForeignKey('auth.User', related_name='modulos_created_by', on_delete=models.CASCADE)
    updated_at = models.DateTimeField(null=True, blank=True, auto_now=True )
    updated_by = models.ForeignKey('auth.User', related_name='modulos_updated_by', null=True, on_delete=models.CASCADE)
    deleted_at = models.DateTimeField(null=True, blank=True)
    deleted_by = models.BigIntegerField(null=True, blank=True)

    class Meta:
        db_table = 'modulos'


class Peticion(models.Model):
    estado = models.CharField(max_length=1091, null=True, blank=True)

    class Meta:
        db_table = 'peticion'