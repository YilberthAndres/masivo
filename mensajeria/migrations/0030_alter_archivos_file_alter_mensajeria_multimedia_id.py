# Generated by Django 4.1.2 on 2023-11-19 02:37

from django.db import migrations, models
import django.db.models.deletion
import mensajeria.validators


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0029_archivos_file'),
    ]

    operations = [
        migrations.AlterField(
            model_name='archivos',
            name='file',
            field=models.FileField(upload_to='mesagge/multimedia/', validators=[mensajeria.validators.validate_image]),
        ),
        migrations.AlterField(
            model_name='mensajeria',
            name='multimedia_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='mensajeria.archivos'),
        ),
    ]