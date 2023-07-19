# Generated by Django 4.2.3 on 2023-07-16 02:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0002_maestras_remove_destinatarios_celular_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personas',
            name='identificacion',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='Identificacion'),
        ),
        migrations.AlterField(
            model_name='personas',
            name='sexo',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_sexo', to='mensajeria.maestras'),
        ),
        migrations.AlterField(
            model_name='personas',
            name='tipoidentificacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_tipoidentificacion', to='mensajeria.maestras'),
        ),
    ]
