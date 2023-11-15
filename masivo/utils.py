from django_celery_beat.models import PeriodicTask, CrontabSchedule
import json


def agregar_tarea_dinamicamente(nombre_tarea, fecha_ejecucion, send_to):
    crontab = CrontabSchedule.objects.create(
        day_of_month=str(fecha_ejecucion.day),
        month_of_year=str(fecha_ejecucion.month),
        hour=fecha_ejecucion.hour,
        minute=fecha_ejecucion.minute,
    )

    tarea = PeriodicTask.objects.create(
        name=nombre_tarea,
        task="mensajeria.tasks.ejecutar_tarea",
        crontab=crontab,
        kwargs=json.dumps({**send_to}),
        enabled=True,
        one_off=True,
    )

    return {"id": tarea.pk, "name": tarea.name}
