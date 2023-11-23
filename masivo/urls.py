"""
URL configuration for masivo project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from mensajeria.views.webhook import webhook
from django.conf import settings
from django.conf.urls.static import static
import debug_toolbar

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("mensajeria.views.urls")),
    path("webhook", webhook.webhook, name="webhook"),
    path("tokenuser", webhook.generate_permanent_token, name="generate_permanent"),
]


if settings.DEBUG:
    
    urlpatterns += [
        path(r"^__debug__/", include(debug_toolbar.urls)),
    ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
