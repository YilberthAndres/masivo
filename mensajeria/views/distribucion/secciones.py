from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos, Maestras
from django.db.models import Q
from django.db.models import Prefetch
from .serializer import SeccionesSerializer, AllSerializer


class SeccionesDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data = request.data[0]
            name = data.get("name", None)
            description = data.get("description", None)
            area_id = data.get("area_id", None)
            user = request.user

            if name == "":
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            else:
                name = name.strip().lower()
                seccion_existente = Secciones.objects.filter(
                    Q(nombre__iexact=name)
                ).first()
                area_existente = Areas.objects.filter(Q(id=area_id)).first()

                if seccion_existente:
                    self.status = status.HTTP_400_BAD_REQUEST
                    self.error = "Ya existe una seccion con el mismo nombre."
                elif not area_existente:
                    self.status = status.HTTP_400_BAD_REQUEST
                    self.error = "Debe agregar un area valida."
                else:
                    new_seccion = Secciones()
                    new_seccion.nombre = name
                    new_seccion.descripcion = description
                    new_seccion.area_id = area_id
                    new_seccion.estado_id = 596
                    new_seccion.created_by = user
                    new_seccion.save()

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)

    def get(self, request, *args, **kwargs):
        try:
            secciones_consulta = (
                Secciones.objects.exclude(estado_id=598)
                .select_related("estado", "created_by")
                .prefetch_related(
                    Prefetch(
                        "grupos_set",
                        queryset=Grupos.objects.exclude(estado_id=598).select_related(
                            "estado", "created_by"
                        ),
                    )
                )
            )

            result_secciones = SeccionesSerializer(secciones_consulta, many=True)

            self.status = status.HTTP_200_OK
            self.data = result_secciones.data

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)

    def put(self, request, *args, **kwargs):
        try:
            data = request.data[0]
            name = data.get("name", None)
            description = data.get("description", None)
            status_id = data.get("status_id", None)
            area_id = data.get("area_id", None)
            user = request.user
            seccion_id = self.kwargs.get("seccion_id", None)
            seccion = Secciones.objects.get(id=seccion_id)

            seccion.nombre = name
            seccion.descripcion = description
            seccion.estado_id = status_id
            seccion.area_id = area_id
            seccion.updated_by = user
            seccion.save()

            return Response(self.response_obj)
        except Secciones.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)

    def delete(self, request, *args, **kwargs):
        try:
            user = request.user
            seccion_id = self.kwargs.get("seccion_id", None)
            seccion = Secciones.objects.get(id=seccion_id)
            seccion.estado_id = 597
            seccion.updated_by = user
            seccion.save()
            return Response(self.response_obj)
        except Secciones.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)


class SeccionesFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:
            seccion_id = self.kwargs.get("seccion_id", None)
            secciones_consulta = (
                Secciones.objects.filter(id=seccion_id)
                .select_related("estado", "created_by")
                .prefetch_related(
                    Prefetch(
                        "grupos_set",
                        queryset=Grupos.objects.exclude(estado_id=598).select_related(
                            "estado", "created_by"
                        ),
                    )
                )
            )

            result_secciones = SeccionesSerializer(secciones_consulta, many=True)

            self.status = status.HTTP_200_OK
            self.data = result_secciones.data

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)


class SeccionesEdit(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:

            status_list     = Maestras.objects.filter(padre_id = 595)
            status_resul    = AllSerializer(status_list, many=True)

            areas_list      = Areas.objects.filter(estado_id = 596).order_by('nombre')
            areas_resul     = AllSerializer(areas_list, many=True)


            data = {
                "estados": status_resul.data,
                "areas": areas_resul.data,
            }

            self.status = status.HTTP_200_OK
            self.data   = data
            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)