# Generated by Django 4.1.2 on 2023-12-25 17:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0044_archivos_page_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='archivos',
            name='weight_file',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=5),
        ),
    ]
