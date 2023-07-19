from celery import shared_task
from twilio.rest import Client
import json

@shared_task
def ejecutar_tarea(*args, **kwargs):
    text = json.loads(kwargs.get("texto"))[0]["insert"]
    # Your Account SID from twilio.com/console
    account_sid = "ACe325be9aca64165382b30e71252982bb"
    # Your Auth Token from twilio.com/console
    auth_token = "02b65b3656e2b187d102a7f52b7bd1f7"

    client = Client(account_sid, auth_token)

    message = client.messages.create(
        to="whatsapp:+573014582878",
        from_="whatsapp:+14155238886",
        body=text,
    )
