from django.urls import path, re_path
from .chat import MenssageLeft

urlpatterns = [
    re_path(r"menssage_left/(?:filter(?P<filter>\w+)/)?(?:list(?P<list>\w+)/)?$", MenssageLeft.as_view()),
]
