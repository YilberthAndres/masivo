from django.urls import path
from .areas import  AreasDistribucion, AreasFind
from .secciones import SeccionesDistribucion

urlpatterns = [

    #AREAS
    path("areas/",   AreasDistribucion.as_view(), name="areas"),
    path("areas/<int:area_id>/find/",   AreasFind.as_view(), name="areas_find"),
    path("areas/<int:area_id>/delete/",   AreasDistribucion.as_view(), name="delete_find"),
    path("areas/<int:area_id>/updated/",   AreasDistribucion.as_view(), name="updated_find"),

    #SECCIONES
    path("secciones/",   SeccionesDistribucion.as_view(), name="areas"),
]
