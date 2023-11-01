from django.urls import path, include


urlpatterns = [
    path("auth/", include("mensajeria.views.auth.urls")),
]
