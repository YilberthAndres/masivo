from mensajeria.models import Destinatarios, Mensajeria
import os
import dotenv

from rest_framework.views import APIView
from ...mixins.base import ResponseMixin
from rest_framework import status
from rest_framework.response import Response
from django.db.models import Value as V, functions
from ..base import api_connect


dotenv.load_dotenv()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


class ListTemplates(APIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        try:
            logger.warning("test")
            response = api_connect(ID_WHATSAPP_BUSINESS_ENV, "/message_templates")
            response_json = response.json()

            data = response_json["data"]

            templates = []
            templates_body = []

            for item in data:
                id_template = item["id"]
                status_template = item["status"]
                name = item["name"]

                resultado = {"id": id_template, "status": status_template, "name": name}

                templates.append(resultado)
                templates_body.append(
                    {
                        "components": item["components"],
                        "language": item["language"],
                        "name": item["name"],
                    }
                )

            self.data = {
                "status": status.HTTP_200_OK,
                "data": {
                    "templates": templates,
                    "templates_body": templates_body,
                },
                "valid": True,
            }

            return Response(self.response_obj)
        except Exception as e:
            self.error = {"error": e.args}
            return Response(self.response_obj)


class ListDestinatarios(APIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        try:
            destinatarios = (
                Destinatarios.objects.only("persona", "id")
                .select_related("persona")
                .annotate(
                    full_name=functions.Concat(
                        "persona__nombre",
                        V(" "),
                        "persona__apellido",
                        V(" "),
                        "persona__segundonombre",
                        V(" "),
                        "persona__segundoapellido",
                    )
                )
            )
            destinatariosnew = [
                {
                    "id": destinatario.id,
                    "nombre": destinatario.full_name,
                    "celular": destinatario.persona.telefonomovil,
                }
                for destinatario in destinatarios
            ]

            self.data = {
                "status": status.HTTP_200_OK,
                "valid": True,
                "data": destinatariosnew,
            }

            return Response(self.response_obj)
        except Exception as e:
            error_message = str(e.args)
            self.error = {
                "error": error_message,
            }
            return Response(self.response_obj)


class SendMensaje(APIView, ResponseMixin):
    def post(self, request, *args, **kwargs):
        destinatarios = request.data.get("destinatarios")
        mensaje = request.data.get("mensaje")

        user = request.user
        for destinatario in destinatarios:
            destinatario = Destinatarios.objects.get(id=destinatario)
            celular = destinatario.persona.telefonomovil

            payload = {
                "messaging_product": "whatsapp",
                "recipient_type": "individual",
                "to": "57" + celular,
                "type": "text",
                "text": {"preview_url": False, "body": mensaje},
            }

            response = response = api_connect(
                ID_WHATSAPP_NUMBER_ENV, "/messages", payload=payload, method="POST"
            )

            response_json = response.json()

            if "error" in response_json:
                self.error = {"message": response_json}
                return Response(self.response_obj)

            nuevo_mensaje = Mensajeria(
                destinatario_id=destinatario.id,
                texto=mensaje,
                celular=response_json["contacts"][0]["wa_id"],
                mensaje_id=response_json["messages"][0]["id"],
                created_by_id=user.id,
            )

            nuevo_mensaje.save()

            self.data = {"data": response_json}

            return Response(self.response_obj)


class SendMessageTemplate(APIView, ResponseMixin):
    def post(self, request, *args, **kwargs):
        parameters = request.data["template"]

        destinatarios = Destinatarios.objects.filter(estado_id=596)
        mensajes = []
        for destinatario in destinatarios:
            celular = destinatario.persona.telefonomovil
            payload = {
                "messaging_product": "whatsapp",
                "recipient_type": "individual",
                "to": "57" + celular,
                "type": "template",
                "template": {},
            }

            if parameters:
                payload["template"] = parameters

            response = api_connect(
                ID_WHATSAPP_NUMBER_ENV, "/messages", payload, method="POST"
            )

            response_json = response.json()
            mensajes.append(response_json)

        self.data = {"response": mensajes}

        return Response(self.response_obj)
