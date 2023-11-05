from django.urls import path
from .carga import Uploaded

app_name = "masivo-upload"

urlpatterns = [
    path("recipients_excel/", Uploaded.as_view(), name="recipients_ecxel"),
]