from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos
from django.db.models import Q
from django.db.models import Prefetch
from .serializer import AreasSerializer

class AreasDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data = request.data[0]
            name = data.get("name", None)
            description = data.get("description", None)
            user = request.user

            if name == "":
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            else:
                name = name.strip().lower()
                area_existente = Areas.objects.filter(Q(nombre__iexact=name)).first()
                if area_existente:
                    self.status = status.HTTP_400_BAD_REQUEST
                    self.error = "Ya existe un área con el mismo nombre."
                else:
                    new_area = Areas()
                    new_area.nombre = name
                    new_area.descripcion = description
                    new_area.estado_id = 596
                    new_area.created_by = user
                    new_area.save()

                    self.status = status.HTTP_200_OK

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)

    def get(self, request, *args, **kwargs):
        try:
            areas_consulta = (
                Areas.objects.filter(estado_id=596)
                .select_related("estado", "created_by")
                .prefetch_related(
                    Prefetch(
                        "secciones_set",
                        queryset=Secciones.objects.filter(estado_id=596).select_related(
                            "estado", "created_by"
                        ).prefetch_related(Prefetch("grupos_set", queryset = Grupos.objects.filter(
                         estado_id=596
                    ).select_related("estado", "created_by"))),
                    )
                )
            )

            result_areas = AreasSerializer(areas_consulta, many=True)

            self.status = status.HTTP_200_OK
            self.data = result_areas.data
            return Response(self.response_obj)

        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)

    def delete(self, request, *args, **kwargs):
        try:
            user            = request.user
            area_id         = self.kwargs.get("area_id", None)
            area            = Areas.objects.get(id=area_id)
            area.estado_id  = 597
            area.updated_by = user
            area.save()
            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)

    def put(self, request, *args, **kwargs):
        try:
            data    = request.data[0]
            user    = request.user
            area_id = self.kwargs.get("area_id", None)
            area    = Areas.objects.get(id=area_id)

            area.nombre         = data.get("name", None)
            area.descripcion    = data.get("description", None)
            area.estado_id      = data.get("status_id", None)
            area.updated_by     = user
            area.save()

            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error  = str(e.args)
            return Response(self.response_obj)


class AreasFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            area_id = self.kwargs.get("area_id", None)
            areas_consulta = (
                Areas.objects.filter(id=area_id, estado_id=596)
                .select_related("estado", "created_by")
                .prefetch_related(
                    Prefetch(
                        "secciones_set",
                        queryset=Secciones.objects.filter(estado_id=596).select_related(
                            "estado", "created_by"
                        ).prefetch_related(Prefetch("grupos_set", queryset = Grupos.objects.filter(
                         estado_id=596
                    ).select_related("estado", "created_by"))),
                    )
                )
            )

            result_areas    = AreasSerializer(areas_consulta, many=True)
            self.status     = status.HTTP_200_OK
            self.data       = result_areas.data
            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)
