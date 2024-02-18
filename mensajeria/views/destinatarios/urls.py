from django.urls import path
from .destinatarios import DestinarioDelete, ListDestinatarios

urlpatterns = [
    path("", ListDestinatarios.as_view()),
    path("<int:destinatario_id>/delete/", DestinarioDelete.as_view()),
]
