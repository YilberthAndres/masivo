from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos
from django.db.models import Q


class SeccionesDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data = request.data[0]
            name = data.get("name", None)
            description = data.get("description", None)
            user = request.user

            area_existente = Areas.objects.filter(Q(nombre=name)).first()

            if name == "":
                self.data = {
                    "data": None,
                    "status": status.HTTP_400_BAD_REQUEST,
                    "message": "El nombre es un campo requerido.",
                }
            elif area_existente:
                self.data = {
                    "data": None,
                    "status": status.HTTP_400_BAD_REQUEST,
                    "message": "Ya existe un área con el mismo nombre.",
                }
            else:
                new_area = Areas()
                new_area.nombre = name
                new_area.descripcion = description
                new_area.estado_id = 596
                new_area.created_by = user
                new_area.save()

                self.data = {
                    "data": None,
                    "status": status.HTTP_200_OK,
                    "message": "Área creada.",
                }

            return Response(self.response_obj)
        except Exception as e:
            self.error = "Ocurrio un error."
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)
