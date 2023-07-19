from celery.schedules import crontab
from django_celery_beat.models import PeriodicTask, IntervalSchedule, CrontabSchedule
import masivo.tasks
import json


def agregar_tarea_dinamicamente(
    nombre_tarea, fecha_ejecucion, fecha_terminacion, texto, adjunto, asunto
):
    crontab = CrontabSchedule.objects.create(
        day_of_month=str(fecha_ejecucion.day),
        month_of_year=str(fecha_ejecucion.month),
        hour=fecha_ejecucion.hour,
        minute=fecha_ejecucion.minute,
    )

    tarea = PeriodicTask.objects.create(
        name=nombre_tarea,
        task="masivo.tasks.ejecutar_tarea",
        crontab=crontab,
        kwargs=json.dumps({"texto":texto, "adjunto":adjunto, "asunto":asunto}),
        enabled=True,
        one_off=True,
    )

    return tarea
