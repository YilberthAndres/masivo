from django_celery_beat.models import PeriodicTask, CrontabSchedule
import json


def agregar_tarea_dinamicamente(
    nombre_tarea, send_to, fecha_ejecucion, fecha_terminacion
):
    try:
        cron = {
            "day_of_month": str(fecha_ejecucion.day),
            "month_of_year": str(fecha_ejecucion.month),
            "hour": fecha_ejecucion.hour,
            "minute": fecha_ejecucion.minute,
        }

        if fecha_terminacion and type(fecha_terminacion) != type([]):
            cron["day_of_month"] = (
                str(fecha_ejecucion.day) + "-" + str(fecha_terminacion.day)
            )
        elif fecha_terminacion:
            cron["day_of_month"] = ",".join([str(x.day) for x in fecha_terminacion])

        crontab = CrontabSchedule.objects.create(**cron)

        tarea = PeriodicTask.objects.create(
            name=nombre_tarea,
            task="mensajeria.tasks.ejecutar_tarea",
            crontab=crontab,
            kwargs=json.dumps({**send_to}),
            enabled=True,
            one_off=True,
        )

        return {"id": tarea.pk, "name": tarea.name, "valid": True}
    except Exception as e:
        return {"error": e.args, "valid": False}
