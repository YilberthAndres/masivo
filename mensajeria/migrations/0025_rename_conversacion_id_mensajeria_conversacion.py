# Generated by Django 4.2.3 on 2023-08-05 18:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0024_alter_mensajeria_conversacion_id'),
    ]

    operations = [
        migrations.RenameField(
            model_name='mensajeria',
            old_name='conversacion_id',
            new_name='conversacion',
        ),
    ]
