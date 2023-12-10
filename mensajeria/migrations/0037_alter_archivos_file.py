# Generated by Django 4.1.2 on 2023-11-26 20:46

from django.db import migrations, models
import mensajeria.validators


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0036_destinatarios_grupo_destinatarios_seccion'),
    ]

    operations = [
        migrations.AlterField(
            model_name='archivos',
            name='file',
            field=models.FileField(upload_to='message/multimedia/', validators=[mensajeria.validators.validate_image]),
        ),
    ]