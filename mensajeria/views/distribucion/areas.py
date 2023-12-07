from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos
from django.db.models import Q
from django.db.models import Prefetch


class AreasDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            user            = request.user
            
            area_existente  = Areas.objects.filter(Q(nombre=name)).first()

            if(name == ''):
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            elif area_existente:
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "Ya existe un área con el mismo nombre."
            else:
                new_area                = Areas()
                new_area.nombre         = name
                new_area.descripcion    = description
                new_area.estado_id      = 596
                new_area.created_by     = user
                new_area.save()

                self.status = status.HTTP_200_OK

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
    def get(self, request,*args, **kwargs):
        try:
            areas_consulta = Areas.objects.filter(estado_id=596).select_related('estado', 'created_by')
            areas = []

            for row in areas_consulta:
                secciones = Secciones.objects.filter(area=row, estado_id = 596).select_related('estado', 'created_by')

                secciones_new = []
                for seccion in secciones:
                    grupos = Grupos.objects.filter(seccion=seccion, estado_id = 596).select_related('estado', 'created_by')
                    grupos_new = [{"id": grupo.id, "nombre": grupo.nombre, "status_id":grupo.estado.id, "status_nombre":grupo.estado.nombre} for grupo in grupos]

                    secciones_new.append({
                        "id": seccion.id,
                        "nombre": seccion.nombre,
                        "grupos": grupos_new,
                        "status_id": seccion.estado.id,
                        "status_nombre": seccion.estado.nombre
                    })

                areas.append({
                    "id": row.id,
                    "name": row.nombre,
                    "secciones": secciones_new,
                    "description": row.descripcion,
                    "status_id": row.estado.id,
                    "status_name": row.estado.nombre,
                    "created_by": row.created_by_id,
                    "created_at": row.created_at
                })



            self.status = status.HTTP_200_OK
            self.data = {
                "data": areas
            }
            return Response(self.response_obj)


        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
    def delete(self, request, *args, **kwargs):
        try: 
            user            = request.user
            area_id         =   self.kwargs.get("area_id", None)
            area            =   Areas.objects.get(id=area_id)
            area.estado_id  = 597
            area.updated_by = user
            area.save()
            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)

    def put(self, request, *args, **kwargs):

        try: 
            
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            status_id       = data.get("status_id", None)
            user            = request.user
            area_id         =   self.kwargs.get("area_id", None)
            area            =   Areas.objects.get(id=area_id)

            area.nombre         = name
            area.descripcion    = description
            area.estado_id      = status_id
            area.updated_by     = user
            area.save()

            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)


class AreasFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers   

    def get(self, request, *args, **kwargs):

        try: 
            area_id =   self.kwargs.get("area_id", None)
            area    =   Areas.objects.get(id=area_id)
        except Areas.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "El area no existe."
            return Response(self.response_obj)

        try:
            secciones = Secciones.objects.filter(area_id = area.id, estado_id = 596)
            secciones_new = []
            for seccion in secciones:
                grupos = Grupos.objects.filter(seccion_id = seccion.id, estado_id = 596)
                grupos_new = []
                for grupo in grupos:
                    grupos_new.append(
                        {
                            "id": grupo.id,
                            "nombre": grupo.nombre,
                            "status_id": grupo.estado.id,
                            "status_nombre": grupo.estado.nombre,
                        }
                    )
                secciones_new .append(
                        {
                            "id" : seccion.id,
                            "nombre" : seccion.nombre,
                            "grupos": grupos_new,
                            "status_id" : seccion.estado.id,
                            "status_nombre" : seccion.estado.nombre,

                        }
                    )
            
            data = {
                "area_id": area.id,
                "name": area.nombre,
                "description": area.descripcion,
                "secciones":secciones_new,
                "status_id": area.estado.id,
                "status_name": area.estado.nombre,
                "created_at": area.created_at,
                "created_by": area.created_by.id
            }
            self.data = {
                "data": data
            }

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
