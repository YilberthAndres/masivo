from django.http import JsonResponse
from mensajeria.models import Destinatarios
from rest_framework.views import APIView
from rest_framework.generics import DestroyAPIView
from ...mixins.base import ResponseMixin
from rest_framework.response import Response
from rest_framework import status
from django.db import models


class ListDestinatarios(APIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        try:
            destinatarios = (
                Destinatarios.objects.only("persona", "id")
                .select_related("persona")
                .annotate(
                    nombre_persona=models.functions.Concat(
                        "persona__nombre",
                        models.Value(" "),
                        "persona__segundonombre",
                        models.Value(" "),
                        "persona__apellido",
                        models.Value(" "),
                        "persona__segundoapellido",
                        models.Value(" "),
                    )
                )
            )

            destinatariosnew = []

            for destinatario in destinatarios:
                persona = destinatario.persona

                destinatarioslist = {
                    "id": destinatario.id,
                    "nombre": destinatario.nombre_persona,
                    "celular": persona.telefonowhatsapp,
                    "estado": destinatario.estado_id,
                    "estado_nombre": destinatario.estado.nombre,
                    "pais": persona.pais.nombre,
                    "pais_codigo": persona.pais.codigo,
                }
                destinatariosnew.append(destinatarioslist)

            self.data = destinatariosnew

            return Response(self.response_obj)
        except Exception as e:
            error_message = str(e)
            self.error = error_message
            return JsonResponse(self.response_obj)


class DestinarioDelete(DestroyAPIView, ResponseMixin):
    def get_object(self):
        try:
            destinatario_id = self.kwargs.get("destinatario_id", None)
            Destinatarios.objects.get(id=destinatario_id)
        except Destinatarios.DoesNotExist:
            return None

    def delete(self, request, *args, **kwargs):
        instance = self.get_object()
        self.meta_data = "DELETE"

        if not instance:
            self.error = {"error": "This destinatario don't exist"}

            return Response(self.response_obj)
        try:
            instance.estado_id = 597
            instance.save()

            self.data = {"data": "Success"}

            return Response(self.response_obj)
        except Exception as e:
            self.error = {"error": e.args}
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)
