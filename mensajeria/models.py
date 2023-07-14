from django.db import models
from django.contrib.auth.models import User, Group
from .models import *
# Create your models here.

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