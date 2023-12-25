from django_celery_beat.models import PeriodicTask, CrontabSchedule
import json


def agregar_tarea_dinamicamente(
    nombre_tarea, send_to, fecha_ejecucion, fecha_terminacion, description
):
    try:
        cron = {
            "day_of_month": str(fecha_ejecucion.day),
            "month_of_year": str(fecha_ejecucion.month),
            "hour": fecha_ejecucion.hour,
            "minute": fecha_ejecucion.minute,
        }

        if fecha_terminacion and not isinstance(fecha_terminacion, list):
            cron["day_of_month"] = (
                str(fecha_ejecucion.day) + "-" + str(fecha_terminacion.day)
            )
        elif fecha_terminacion:
            for i in fecha_terminacion:
                if i < fecha_ejecucion:
                    raise TypeError(f"Fecha invalidad, {i}")
                cron["day_of_month"] += f",{i.day}"

        crontab = CrontabSchedule.objects.create(**cron)

        tarea = PeriodicTask.objects.create(
            name=nombre_tarea,
            task="mensajeria.tasks.ejecutar_tarea",
            crontab=crontab,
            kwargs=json.dumps({**send_to}),
            enabled=True,
            one_off=True,
            description=description,
        )

        return {"id": tarea.pk, "name": tarea.name, "valid": True}
    except Exception as e:
        return {"error": e.args, "valid": False}
