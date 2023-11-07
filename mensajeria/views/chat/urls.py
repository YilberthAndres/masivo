from django.urls import path
from .chat import MenssageLeft

app_name = "masivo-upload"

urlpatterns = [
    path("menssage_left/",  MenssageLeft.as_view(), name="menssage_left"),

]