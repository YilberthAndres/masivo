from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos
from django.db.models import Q

class GruposDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            seccion_id      = data.get("seccion_id", None)
            user            = request.user
            
            grupo_existente  = Grupos.objects.filter(Q(nombre=name)).first()

            if(name == ''):
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            elif grupo_existente:
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "Ya existe un área con el mismo nombre."
            else:
                new_grupo                = Grupos()
                new_grupo.nombre         = name
                new_grupo.descripcion    = description
                new_grupo.estado_id      = 596
                new_grupo.seccion_id     = seccion_id
                new_grupo.created_by     = user
                new_grupo.save()

                self.status = status.HTTP_200_OK

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)

    def get(self, request,*args, **kwargs):
        try:
            grupos_consulta  = Grupos.objects.filter(estado_id=596)
            grupos           = []

            for row in grupos_consulta:
                grupos.append(
                    {
                        "id": row.id,
                        "name": row.nombre,
                        "description": row.descripcion,
                        "seccion_id": row.seccion.id,
                        "seccion_nombre": row.seccion.nombre,
                        "status_id": row.estado.id,
                        "status_name": row.estado.nombre,
                        "created_by": row.created_by_id,
                        "created_at": row.created_at
                    }
                )
            self.status = status.HTTP_200_OK
            self.data = {
                "data": grupos
            }
            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
    def put(self, request,*args, **kwargs):
        try: 
            
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            seccion_id      = data.get("seccion_id", None)
            status_id       = data.get("status_id", None)
            user            = request.user
            grupo_id        = self.kwargs.get("grupo_id", None)
            grupo            = Grupos.objects.get(id=grupo_id)

            grupo.nombre         = name
            grupo.descripcion    = description
            grupo.seccion_id     = seccion_id
            grupo.estado_id      = status_id
            grupo.updated_by     = user
            grupo.save()

            return Response(self.response_obj)
        except Grupos.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)
        
    def delete(self, request, *args, **kwargs):
        try: 
            user                = request.user
            grupo_id            = self.kwargs.get("grupo_id", None)
            grupo               = Grupos.objects.get(id=grupo_id)
            grupo.estado_id     = 597
            grupo.updated_by    = user
            grupo.save()
            return Response(self.response_obj)
        except Grupos.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "Ocurrio un error."
            return Response(self.response_obj)  
        
class GruposFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers   

    def get(self, request, *args, **kwargs):

        try: 
            area_id =   self.kwargs.get("grupo_id", None)
            area    =   Grupos.objects.get(id=area_id)
        except Grupos.DoesNotExist as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = "El area no existe."
            return Response(self.response_obj)

        try:
            
            data = {
                "area_id": area.id,
                "name": area.nombre,
                "description": area.descripcion,
                "seccion_id": area.seccion.id,
                "seccion_nombre": area.seccion.nombre,
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
