from mensajeria.models import Archivos
import os
import dotenv
from ..base import capture_first_page_from_s3

dotenv.load_dotenv()
from django.core.files.storage import get_storage_class

media_storage = get_storage_class()()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status


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
            file_ = request.FILES["file"]
            name = request.POST.get("name")

            file_format = self.get_info(file_)
            user = request.user

            file_model = Archivos()
            file_model.file = file_
            file_model.nombre = name
            file_model.tipo = file_format
            file_model.created_by = user

            file_model.save()

            base64, page_count, weight = capture_first_page_from_s3(
                "masivo", "static/" + file_model.file.name
            )

            file_model.preview = base64
            file_model.page_count = page_count
            file_model.weight_file = weight

            file_model.save()

            self.status = status.HTTP_200_OK
            self.data = "Exitoso"
            return Response(self.response_obj)

        except Exception as e:
            self.error = str(e.args)
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)


class AllMultimedia(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            archivos = Archivos.objects.all()

            files = []
            for archivo in archivos:
                aws_file = {
                    "file_id": archivo.id,
                    "name": archivo.nombre,
                    "dir": media_storage.url(name=archivo.file.name),
                    "type": archivo.tipo,
                }

                files.append(aws_file)

            self.data = files
            return Response(self.response_obj)

        except Exception as e:
            self.error = str(e.args)
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)
