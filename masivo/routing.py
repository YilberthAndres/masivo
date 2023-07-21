
from django.urls import re_path
from mensajeria import consumers
from django.core.asgi import get_asgi_application

import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "masivo.settings")
django_asgi_app = get_asgi_application()

# URLs that handle the WebSocket connection are placed here.
websocket_urlpatterns = [
    re_path(r"ws/chat/(?P<chat_box_name>\w+)/$", consumers.ChatRoomConsumer.as_asgi()),
]


