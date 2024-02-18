from celery import shared_task
import json
from mensajeria.views.base import send_message_api

@shared_task
def ejecutar_tarea(*args, **kwargs):
    # send_message_api(kwargs)
