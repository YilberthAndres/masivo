from django.urls import path
from .areas import  AreasDistribucion, AreasFind
from .secciones import SeccionesDistribucion, SeccionesFind
from .grupos import GruposDistribucion, GruposFind

urlpatterns = [

    #AREAS
    path("areas/",   AreasDistribucion.as_view(), name="areas"),
    path("areas/<int:area_id>/find/",   AreasFind.as_view(), name="areas_find"),
    path("areas/<int:area_id>/delete/",   AreasDistribucion.as_view(), name="areas_delete"),
    path("areas/<int:area_id>/updated/",   AreasDistribucion.as_view(), name="areas_updated"),

    #SECCIONES
    path("secciones/",   SeccionesDistribucion.as_view(), name="secciones"),
    path("secciones/<int:seccion_id>/updated/",  SeccionesDistribucion.as_view(), name="secciones_updated"),
    path("secciones/<int:seccion_id>/delete/",  SeccionesDistribucion.as_view(), name="secciones_delete"),
    path("secciones/<int:seccion_id>/find/",  SeccionesFind.as_view(), name="secciones_find"),


    #GRUPOS 
    path("grupos/",   GruposDistribucion.as_view(), name="grupos"),
    path("grupos/<int:grupo_id>/updated/",  GruposDistribucion.as_view(), name="grupos_updated"),
    path("grupos/<int:grupo_id>/delete/",  GruposDistribucion.as_view(), name="grupos_delete"),
    path("grupos/<int:grupo_id>/find/",  GruposFind.as_view(), name="grupos_find"),
]
