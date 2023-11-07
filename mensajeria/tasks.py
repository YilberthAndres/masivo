from celery import shared_task
from mensajeria.models import Peticion

@shared_task
def my_task(personas):
  
    for persona in personas:
        print("Nueva persona")
        nueva_peticion = Peticion(estado = persona['nombre'])
        nueva_peticion.save()
    return True