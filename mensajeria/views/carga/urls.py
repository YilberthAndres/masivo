from django.urls import path
from .carga import Uploaded, Save, DestinatarioCreate
from .carga_distribucion import Preparation, Save
from .cargar_grupo import PreparationGrupo

app_name = "masivo-upload"

urlpatterns = [
    path("recipients_excel/",   Uploaded.as_view(), name="recipients_ecxel"),
    path("recipients_create/",   DestinatarioCreate.as_view(), name="recipients_create"),
    path("recipients_save/",    Save.as_view(), name="recipients_save"),


    #AREA DISTRIBUTIONS
    path("recipients_excel_area/",   Preparation.as_view(), name="recipients_excel_area"),
    path("recipients_save_area/",    Save.as_view(), name="recipients_save_area"),


    #GRUPO DISTRIBUTIONS
    path("recipients_excel_grupo/",   PreparationGrupo.as_view(), name="recipients_excel_grupo"),
]