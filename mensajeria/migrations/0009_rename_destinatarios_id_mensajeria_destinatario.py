# Generated by Django 4.2 on 2023-07-17 01:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0008_mensajeria_destinatarios_id'),
    ]

    operations = [
        migrations.RenameField(
            model_name='mensajeria',
            old_name='destinatarios_id',
            new_name='destinatario',
        ),
    ]
