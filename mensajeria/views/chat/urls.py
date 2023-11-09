from django.urls import path
from .chat import MenssageLeft, MenssageFind, MenssageSend

urlpatterns = [
    path("message_left/",  MenssageLeft.as_view(), name="message_left"),
    path("message_find/",  MenssageFind.as_view(), name="message_find"),
    path("message_send/",  MenssageSend.as_view(), name="message_send"),

]
