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
from django.urls import path
from mensajeria.views.auth import auth
from mensajeria.views.multimedia import multimedia
from mensajeria.views.carga import carga
from mensajeria.views.destinatarios import destinatarios
from mensajeria.views.mensajes import mensajes
from mensajeria.views.webhook import webhook
from mensajeria.views.mensajeria import mensajeria

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", auth.home, name="home"),
    # AUTHENTICATION
    path("signup/", auth.signup, name="signup"),
    path("lognout/", auth.signout, name="lognout"),
    # REGISTER
    path('signin/', auth.signin, name='signin'),

    #Multimedia
    path('multimedia/', multimedia.index, name='multimedia-index'),
    path('multimedia/create', multimedia.create, name='multimedia-create'),
    path('multimedia/uploaded', multimedia.uploaded, name='multimedia-uploaded'),
    path('multimedia/<int:archivo_id>/delete', multimedia.delete, name='multimedia-delete'),
    path('multimedia/list', multimedia.list, name='multimedia-list'),
    path('multimedia/get_media', multimedia.get_media, name='multimedia-get_media'),

    #CARGA
    path('carga/', carga.index, name='carga-index'),
    path('carga/uploaded', carga.uploaded, name='carga-uploaded'),

    #DESTINATARIOS
    path('destinatarios/', destinatarios.index, name='destinatarios-index'),
    path('destinatarios/list', destinatarios.list, name='destinatarios-list'),
    path('destinatarios/<int:destinatario_id>/delete', destinatarios.delete, name='destinatario-delete'),

    #WEBHOOK
    path('webhook', webhook.webhook, name='webhook'),
    path('tokenuser', webhook.generate_permanent_token, name='generate_permanent'),


    #MENSAJERIA VISTAS Y RECURSOS
    path('chat', mensajes.mensajes, name='chat_index'),
    path('chat_templates', mensajes.index, name='chat_templates'),
    path('list_destinatarios', mensajeria.list_destinatarios, name='list_destinatarios'),
    path('templates', mensajeria.templates, name='mensajes_templates'),
    path('get_menssage', mensajes.obtener_mensajes, name='mensajes_obtener_mensajes'),
    path('get_menssage/<int:recipiente_id>', mensajes.obtener_mensajes_find, name='mensajes_obtener_mensajes_find'),


    #MENSAJERIA ENVIO
    path('send_message', mensajes.send_message, name='send_message'),
    path('send_message_template', mensajeria.send_message_template, name='send_message_template'),

]
