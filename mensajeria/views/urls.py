from django.urls import path, include


urlpatterns = [
    path("auth/", include("mensajeria.views.auth.urls")),
    path("destinatarios/", include("mensajeria.views.destinatarios.urls")),
    path("mensajeria/", include("mensajeria.views.mensajeria.urls")),
    path("upload/", include("mensajeria.views.carga.urls")),
    path("chat/", include("mensajeria.views.chat.urls")),
    path("multimedia/", include("mensajeria.views.multimedia.urls")),
    path("distribucion/", include("mensajeria.views.distribucion.urls")),
    path("perfil/", include("mensajeria.views.perfil.urls")),
]
