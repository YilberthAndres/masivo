from celery import shared_task, app
import json
from mensajeria.views.base import send_message_api

{
    "send_to": {
        "recipient_id": 3781,
        "recipient_w": "573014582878",
        "message": "test",
        "file_id": "",
        "type_message": "text",
        "user_id": 2,
    }
}


@shared_task
def ejecutar_tarea(*args, **kwargs):
    send_message_api(kwargs)
