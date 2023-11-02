from django.urls import path
from .mensajeria import SendMensaje, ListDestinatarios, ListTemplates

urlpatterns = [
    path("send/", SendMensaje.as_view()),
    path("template/list/", ListTemplates.as_view()),
    path("destinatarios/list/", ListDestinatarios.as_view()),
]
