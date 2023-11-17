from django.urls import path
from .chat import (
    MenssageLeft,
    MenssageFind,
    MenssageSend,
    ProgrammedSend,
    GetTaskProgrammed,
)

urlpatterns = [
    path("message_left/", MenssageLeft.as_view(), name="message_left"),
    path("message_find/", MenssageFind.as_view(), name="message_find"),
    path("message_send/", MenssageSend.as_view(), name="message_send"),
    path("message/programmed/", ProgrammedSend.as_view(), name="message-programmed"),
    path("programmed/", GetTaskProgrammed.as_view(), name="get-message-programmed"),
]
