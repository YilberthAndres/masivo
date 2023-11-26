from rest_framework.generics import CreateAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from rest_framework.response import Response
from rest_framework import status
from mensajeria.models import Areas
from django.db.models import Q

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
                new_area                = Areas()
                new_area.nombre         = name
                new_area.descripcion    = description
                new_area.estado_id      = 596
                new_area.created_by     = user
                new_area.save()

                self.data = {
                "data": None,
                "status": status.HTTP_200_OK,
                "message": "Área creada.",
                }


            return Response(self.response_obj)
        except Exception as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "Ocurrio un error.",
            }
            return Response(self.response_obj)
        
    def get(self, request,*args, **kwargs):
        try:
            areas_consulta  = Areas.objects.filter(estado_id=596)
            areas           = []

            for row in areas_consulta:
                areas.append(
                    {
                        "id": row.id,
                        "name": row.nombre,
                        "description": row.descripcion,
                        "status_id": row.estado.id,
                        "status_name": row.estado.nombre,
                        "created_by": row.created_by_id,
                        "created_at": row.created_at
                    }
                )
            self.data = {
                "data": areas,
                "status": status.HTTP_200_OK,
                "message": "Exitoso.",
            }
            return Response(self.response_obj)


        except Exception as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "Ocurrio un error.",
            }
            return Response(self.response_obj)
        
    def delete(self, request, *args, **kwargs):
        try: 
            area_id =   self.kwargs.get("area_id", None)
            area    =   Areas.objects.get(id=area_id)
            area.delete()
            self.data = {
                "data": None,
                "status": status.HTTP_200_OK,
                "message": "succes",
            }

            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "Ocurrio un error.",
            }
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
            
            self.data = {
                "data": None,
                "status": status.HTTP_200_OK,
                "message": "succes",
            }

            return Response(self.response_obj)
        except Areas.DoesNotExist as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "Ocurrio un error.",
            }
            return Response(self.response_obj)


class AreasFind(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers   

    def get(self, request, *args, **kwargs):

        try: 
            area_id =   self.kwargs.get("area_id", None)
            area    =   Areas.objects.get(id=area_id)
        except Areas.DoesNotExist as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "El area no existe.",
            }
            return Response(self.response_obj)

        try:
            
            data = {
                "area_id": area.id,
                "name": area.nombre,
                "description": area.descripcion,
                "status_id": area.estado.id,
                "status_name": area.estado.nombre,
                "created_at": area.created_at,
                "created_by": area.created_by.id
            }
            self.data = {
                "data": data,
                "status": status.HTTP_200_OK,
                "message": "succes",
            }

            return Response(self.response_obj)
        except Exception as e:
            self.data = {
                "data": None,
                "status": status.HTTP_400_BAD_REQUEST,
                "message": "Ocurrio un error.",
            }
            return Response(self.response_obj)
