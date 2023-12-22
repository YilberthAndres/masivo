from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas, Secciones, Grupos, Maestras
from django.db.models import Q
from django.db.models import Prefetch
from .serializer import GruposSerializer, AllSerializer

import os
PARENT_STATE_ENV = os.getenv("PARENT_STATE")

class GruposDistribucion(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        try:
            data            = request.data[0]
            name            = data.get("name", None)
            description     = data.get("description", None)
            seccion_id      = data.get("seccion_id", None)
            user            = request.user
            
            

            if(name == ''):
                self.status = status.HTTP_400_BAD_REQUEST
                self.error = "El nombre es un campo requerido."
            else:
                name = name.strip().lower()
                grupo_existente  = Grupos.objects.filter(Q(nombre__iexact=name)).first()
                if grupo_existente:
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
            self.error = e.args
            return Response(self.response_obj)

    def get(self, request,*args, **kwargs):
        try:
            secciones_consulta =  (
                Grupos.objects.filter(
                    estado_id=596
                ).select_related("estado", "created_by") 
            )
            
            result_secciones = GruposSerializer(secciones_consulta, many=True)

            self.status = status.HTTP_200_OK
            self.data = result_secciones.data

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
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
            self.error = e.args
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
            self.error = e.args
            return Response(self.response_obj)  
        
class GruposFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers   

    def get(self, request, *args, **kwargs):

        try: 
            area_id =   self.kwargs.get("grupo_id", None)
            secciones_consulta =  (
                Grupos.objects.filter(
                    id=area_id
                ).select_related("estado", "created_by") 
            )
            
            result_secciones = GruposSerializer(secciones_consulta, many=True)

            self.status = status.HTTP_200_OK
            self.data = result_secciones.data

            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = e.args
            return Response(self.response_obj)

class GruposEdit(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def get(self, request, *args, **kwargs):
        try:

            status_list     = Maestras.objects.filter(padre_id = 595)
            status_resul    = AllSerializer(status_list, many=True)

            secciones_list  = Secciones.objects.filter(estado_id = 596).order_by('nombre')
            secciones_resul = AllSerializer(secciones_list, many=True)


            data = {
                "estados": status_resul.data,
                "secciones": secciones_resul.data,
            }

            self.status = status.HTTP_200_OK
            self.data   = data
            return Response(self.response_obj)
        except Exception as e:
            self.status = status.HTTP_400_BAD_REQUEST
            self.error = str(e.args)
            return Response(self.response_obj)