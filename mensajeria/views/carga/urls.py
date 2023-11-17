from django.urls import path
from .carga import Uploaded, Save, DestinatarioCreate

app_name = "masivo-upload"

urlpatterns = [
    path("recipients_excel/",   Uploaded.as_view(), name="recipients_ecxel"),
    path("recipients_create/",   DestinatarioCreate.as_view(), name="recipients_create"),
    path("recipients_save/",    Save.as_view(), name="recipients_save"),
]