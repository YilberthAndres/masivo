from django.urls import path
from .multimedia import Uploaded, AllMultimedia

urlpatterns = [
    path("uploaded_multimedia/",  Uploaded.as_view(), name="uploaded_multimedia"),
    path("all_multimedia/",  AllMultimedia.as_view(), name="all_multimedia"),
]
