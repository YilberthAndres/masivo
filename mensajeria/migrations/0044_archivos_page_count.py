# Generated by Django 4.1.2 on 2023-12-25 16:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0043_alter_grupos_seccion'),
    ]

    operations = [
        migrations.AddField(
            model_name='archivos',
            name='page_count',
            field=models.IntegerField(default=0),
        ),
    ]
