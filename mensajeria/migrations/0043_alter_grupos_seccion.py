# Generated by Django 4.1.2 on 2023-12-10 20:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0042_alter_secciones_area'),
    ]

    operations = [
        migrations.AlterField(
            model_name='grupos',
            name='seccion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='mensajeria.secciones'),
        ),
    ]
