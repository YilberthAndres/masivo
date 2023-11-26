# Generated by Django 4.1.2 on 2023-11-22 02:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mensajeria', '0030_alter_archivos_file_alter_mensajeria_multimedia_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='Paises',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
            ],
        ),
        migrations.AlterField(
            model_name='personas',
            name='pais',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_pais', to='mensajeria.paises'),
        ),
    ]