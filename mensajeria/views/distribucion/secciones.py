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
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            area_id            = data.get("area_id", None)
            user            = request.user
            
            seccion_existente   = Secciones.objects.filter(Q(nombre=name)).first()
            area_existente      = Areas.objects.filter(Q(id = area_id)).first()

            if(name == ''):
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            elif seccion_existente:
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "Ya existe una seccion con el mismo nombre."
            elif not area_existente:
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "Debe agregar un area valida."
            else:
                new_seccion                = Secciones()
                new_seccion.nombre         = name
                new_seccion.descripcion    = description
                new_seccion.area_id        = area_id
                new_seccion.estado_id      = 596
                new_seccion.created_by     = user
                new_seccion.save()

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)

    def get(self, request, *args, **kwargs):

        try:
            secciones_consulta  = Secciones.objects.filter(estado_id=596)
            secciones           = []

            for row in secciones_consulta:

                grupos = Grupos.objects.filter(seccion_id = row.id, estado_id = 596)
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
                secciones.append(
                    {
                        "id": row.id,
                        "name": row.nombre,
                        "description": row.descripcion,
                        "description": row.descripcion,
                        "area_id": row.area.id,
                        "area_nombre": row.area.nombre,
                        "grupos": grupos_new,
                        "status_id": row.estado.id,
                        "status_name": row.estado.nombre,
                        "created_by": row.created_by_id,
                        "created_at": row.created_at
                    }
                )
            self.status = status.HTTP_200_OK
            self.data = {
                "data": secciones
            }

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)

    def put(self, request, *args, **kwargs):
        try: 
            
            data            =   request.data[0]
            name            =   data.get("name", None)
            description     =   data.get("description", None)
            status_id       =   data.get("status_id", None)
            area_id         =   data.get("area_id", None)
            user            =   request.user
            seccion_id      =   self.kwargs.get("seccion_id", None)
            seccion         =   Secciones.objects.get(id=seccion_id)

            seccion.nombre         = name
            seccion.descripcion    = description
            seccion.estado_id      = status_id
            seccion.area_id        = area_id
            seccion.updated_by     = user
            seccion.save()

            return Response(self.response_obj)
        except Secciones.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        

    def delete(self, request, *args, **kwargs):
        try:
            user                =   request.user
            seccion_id          =   self.kwargs.get("seccion_id", None)
            seccion             =   Secciones.objects.get(id=seccion_id)
            seccion.estado_id   =   597
            seccion.updated_by  =   user
            seccion.save()
            return Response(self.response_obj)
        except Secciones.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
class SeccionesFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers   

    def get(self, request, *args, **kwargs):

        try: 
            seccion_id =   self.kwargs.get("seccion_id", None)
            seccion    =   Secciones.objects.get(id=seccion_id, estado_id = 596)
        except Secciones.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "El seccion no existe."
            return Response(self.response_obj)

        try:
            
            data = {
                "seccion_id": seccion.id,
                "name": seccion.nombre,
                "description": seccion.descripcion,
                "area_id": seccion.area.id,
                "area_nombre": seccion.area.nombre,
                "status_id": seccion.estado.id,
                "status_name": seccion.estado.nombre,
                "created_at": seccion.created_at,
                "created_by": seccion.created_by.id
            }
            self.data = {
                "data": data
            }

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
