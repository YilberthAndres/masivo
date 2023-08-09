# Generated by Django 4.2.3 on 2023-08-05 19:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0027_alter_conversaciones_destinatario'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personas',
            name='telefonomovil',
            field=models.CharField(blank=True, max_length=10, unique=True, verbose_name='Telefono movil'),
        ),
        migrations.AlterField(
            model_name='personas',
            name='telefonowhatsapp',
            field=models.CharField(blank=True, max_length=50, null=True, unique=True),
        ),
    ]