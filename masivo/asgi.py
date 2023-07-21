from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.security.websocket import AllowedHostsOriginValidator
import os

from django.core.asgi import get_asgi_application
import masivo.routing

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "masivo.settings")

django_asgi_app = get_asgi_application()

application = ProtocolTypeRouter(
    {
        "http": django_asgi_app,
        "websocket": AllowedHostsOriginValidator(
            AuthMiddlewareStack(URLRouter(masivo.routing.websocket_urlpatterns))
        ),
    }
)
