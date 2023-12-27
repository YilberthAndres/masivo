import requests
import os
import base64
import json
from mensajeria.models import (
    Paises,
    Peticion,
)
from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos
from django.db.models import Q
from django.db.models import Prefetch
API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_NUMBER_ENV   = os.getenv("ID_WHATSAPP_NUMBER")
VERIFY_TOKEN_ENV         = os.getenv("VERIFY_TOKEN_ENV")

class PhotoUpdate(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def put(self, request, *args, **kwargs):
        # 
        try:
            file = request.FILES["file"]
            if not file.content_type.startswith("image/"):
                raise ValueError("Invalid file type. Only images are allowed.")
            
            headers = {"Authorization": f"Bearer {VERIFY_TOKEN_ENV}"}
            if file.content_type == "image/jpeg":
                headers["Content-Type"] = "image/jpeg"
            elif file.content_type == "image/png":
                headers["Content-Type"] = "image/png"
            else:
                raise ValueError("Unsupported image format.")
            
            solicitud = requests.post(
                "https://api.whatsapp.com/v1/settings/profile/photo",
                headers=headers,
                data=file,
            )
            
            # solicitud = requests.post(
            #     "https://api.whatsapp.com/v1/business/profile/photo",
            #     headers={"Authorization": VERIFY_TOKEN_ENV},
            #     data=file,
            # )

            print(solicitud)

            # statuses_text = json.dumps(solicitud)
            # nueva_peticion = Peticion(estado=statuses_text)
            # nueva_peticion.save()



            return Response(self.response_obj)
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

