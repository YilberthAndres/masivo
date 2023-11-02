import requests
from mensajeria.models import Destinatarios, Mensajeria
import os
import json
import dotenv

from rest_framework.views import APIView
from ...mixins.base import ResponseMixin
from rest_framework import status
from rest_framework.response import Response

dotenv.load_dotenv()

API_KEY_ENV = os.getenv("API_KEY")
ID_WHATSAPP_BUSINESS_ENV = os.getenv("ID_WHATSAPP_BUSINESS")
ID_WHATSAPP_NUMBER_ENV = os.getenv("ID_WHATSAPP_NUMBER")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


class ListTemplates(APIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        url = (
            "https://graph.facebook.com/"
            + API_VERSION_WHATSAPP_ENV
            + "/"
            + ID_WHATSAPP_BUSINESS_ENV
            + "/message_templates"
        )


        headers = {"Authorization": API_KEY_ENV, "Content-Type": "application/json"}

        response = requests.get(url, headers=headers)
        response_json = response.json()

        print(response_json)

        # data = response_json["data"]

        templates = []
        templates_body = []

        # for item in data:
        #     id_template = item["id"]
        #     status_template = item["status"]
        #     name = item["name"]

        #     resultado = {"id": id_template, "status": status_template, "name": name}

        #     templates.append(resultado)
        #     templates_body.append(
        #         {
        #             "components": item["components"],
        #             "language": item["language"],
        #             **resultado,
        #         }
        #     )

        self.data = {
            "status": status.HTTP_200_OK,
            "data": {
                "templates": json.dumps(templates),
                "templates_body": json.dumps(templates_body),
            },
            "valid": True,
        }

        return Response(self.response_obj)


class ListDestinatarios(APIView, ResponseMixin):
    def post(self, request, *args, **kwargs):
        try:
            destinatarios = Destinatarios.objects.only("persona", "id").select_related(
                "persona"
            )
            destinatariosnew = []

            for destinatario in destinatarios:
                persona = destinatario.persona

                nombre_persona = (
                    persona.nombre
                    + " "
                    + persona.segundonombre
                    + " "
                    + persona.apellido
                    + " "
                    + persona.segundoapellido
                )
                destinatarioslist = {
                    "id": destinatario.id,
                    "nombre": nombre_persona,
                    "celular": persona.telefonomovil,
                }
                destinatariosnew.append(destinatarioslist)

            self.data = {
                "status": status.HTTP_200_OK,
                "valid": True,
                "data": json.dumps(destinatariosnew),
            }

            return Response(self.response_obj, safe=False)
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

            url = (
                "https://graph.facebook.com/"
                + API_VERSION_WHATSAPP_ENV
                + "/"
                + ID_WHATSAPP_NUMBER_ENV
                + "/messages"
            )

            headers = {
                "Authorization": API_KEY_ENV,
                "Content-Type": "application/json",
            }

            payload = {
                "messaging_product": "whatsapp",
                "recipient_type": "individual",
                "to": "57" + celular,
                "type": "text",
                "text": {"preview_url": False, "body": mensaje},
            }

            response = requests.post(url, headers=headers, json=payload)

            response_json = response.json()

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


# [{"type":"HEADER","key":"header_text","value":"Nelson"},{"type":"BODY","key":"body_text","value":["Nelson","Nelson"]}]
# @login_required()
# def send_message_template(request):
#     if request.method == "POST":
#         destinatarios = request.POST.getlist(
#             "destinatarios"
#         )  # Obtener una lista de los valores de destinatarios
#         template = request.POST.get("templates")
#         parameters = request.POST.get("parameters")
#         data = {
#             "destinatarios": destinatarios
#         }  # Crear un diccionario con el valor de destinatarios
#         user = request.user
#         # user = User.objects.get(id=user.id)
#         # return JsonResponse(data)

#         destinatarios = Destinatarios.objects.filter(estado_id=596)

#         components = []

#         if parameters:
#             parameters = json.loads(parameters)

#         for destinatario in destinatarios:
#             # destinatario = Destinatarios.objects.get(id=destinatario)
#             # celular = destinatario.persona.telefonomovil
#             # # return JsonResponse({'destinatario_id': })
#             celular = destinatario.persona.telefonomovil

#             url = (
#                 "https://graph.facebook.com/"
#                 + API_VERSION_WHATSAPP_ENV
#                 + "/"
#                 + ID_WHATSAPP_NUMBER_ENV
#                 + "/messages"
#             )
#             headers = {"Authorization": API_KEY_ENV, "Content-Type": "application/json"}
#             payload = {
#                 "messaging_product": "whatsapp",
#                 # "recipient_type": "individual",
#                 "to": "57" + celular,
#                 "type": "template",
#                 "template": {
#                     "name": parameters["templateName"],
#                     "language": {"code": parameters["language"]},
#                 },
#             }

#             # print(parameters["components"])

#             if parameters:
#                 payload["template"]["components"] = parameters["components"]

#             response = requests.post(url, headers=headers, json=payload)

#             # Obtener el contenido de la respuesta en formato JSON
#             response_json = response.json()
#             print(response_json)
#             return JsonResponse({"message": "Ok"})

#         #     waId = response_json["contacts"][0]["wa_id"]
#         #     messageId = response_json["messages"][0]["id"]

#         # nuevo_mensaje = Mensajeria(
#         #     destinatario_id=destinatario.id,
#         #     tipo_id=754,
#         #     celular=waId,
#         #     mensaje_id=messageId,
#         #     created_by_id=user.id,
#         # )

#         # nuevo_mensaje.save()

#         # # Retornar la respuesta como un JSON
#         # return JsonResponse(response_json)
