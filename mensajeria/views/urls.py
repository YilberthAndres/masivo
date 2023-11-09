from django.urls import path, include


urlpatterns = [
    path("auth/", include("mensajeria.views.auth.urls")),
    path("destinatarios/", include("mensajeria.views.destinatarios.urls")),
    path("mensajeria/",include("mensajeria.views.mensajeria.urls")),
    path("upload/", include("mensajeria.views.carga.urls")),
    path("chat/", include("mensajeria.views.chat.urls")),
]
