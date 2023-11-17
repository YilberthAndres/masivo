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


API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


from rest_framework.generics import CreateAPIView, GenericAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from ...serializers.auth.signin_serializers import SigninSerializers
from rest_framework.response import Response
from rest_framework import status

from django.core.validators import validate_email
from django.core.exceptions import ValidationError


class Uploaded(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get_info(self, file):
        file_format = "document"
        if file.content_type.startswith("image/"):
            file_format = "image"
        elif file.content_type.startswith("video/"):
            file_format = "video"
        elif file.content_type.startswith("audio/"):
            file_format = "audio"

        return file_format

    def post(self, request, *args, **kwargs):
        try:
            file = request.FILES["file"]
            name = request.POST.get("name")

            file_format = self.get_info(file)
            user = request.user

            file_model = Archivos()
            file_model.file = file
            file_model.nombre = name
            file_model.tipo = file_format
            file_model.created_by = user

            file_model.save()

            self.data = {
                "status"    : status.HTTP_200_OK,
                "data"      : {},
                "message"   : "Exitoso",
                "error"     : False,
            }
            return Response(self.response_obj)

        except Exception as e:
            self.data = {
                "status"    : status.HTTP_400_BAD_REQUEST,
                "data"      : {},
                "message"   : "Ocurrio un error",
                "error"     : True,
            }
            return Response(self.response_obj)
            


class AllMultimedia(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, file):
        try:
            archivos = Archivos.objects.all()

            files = []
            for archivo in archivos:
                file = {
                    "file_id"   : archivo.id,
                    "name"      : archivo.nombre,
                    "dir"       : archivo.file.url,
                    "type"      : archivo.tipo,
                }

                files.append(file)

            self.data = {
                "status"    : status.HTTP_200_OK,
                "data"      : files,
                "message"   : "Exitoso",
                "error"     : False,
            }
            return Response(self.response_obj)

        except Exception as e:
            self.data = {
                "status"    : status.HTTP_400_BAD_REQUEST,
                "data"      : {},
                "message"   : "Ocurrio un error.",
                "error"     : True,
            }
            return Response(self.response_obj)
