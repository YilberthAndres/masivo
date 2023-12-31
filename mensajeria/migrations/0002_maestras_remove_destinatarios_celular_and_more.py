# Generated by Django 4.2.3 on 2023-07-16 02:11

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('mensajeria', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Maestras',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('codigo', models.CharField(max_length=200, null=True)),
                ('nombre', models.CharField(max_length=200)),
                ('jerarquia', models.IntegerField(null=True)),
                ('orden', models.IntegerField(null=True)),
                ('visible', models.IntegerField(null=True)),
                ('observacion', models.CharField(max_length=200, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('deleted_by', models.BigIntegerField(blank=True, null=True)),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='maestras_created_by', to=settings.AUTH_USER_MODEL)),
                ('padre', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='mensajeria.maestras')),
                ('updated_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='maestras_updated_by', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'maestra',
                'verbose_name_plural': 'maestras',
                'db_table': 'maestras',
            },
        ),
        migrations.RemoveField(
            model_name='destinatarios',
            name='celular',
        ),
        migrations.RemoveField(
            model_name='destinatarios',
            name='nombre',
        ),
        migrations.CreateModel(
            name='Personas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identificacion', models.CharField(blank=True, max_length=50, verbose_name='Identificacion')),
                ('lugarexpedicion', models.CharField(blank=True, max_length=50, null=True, verbose_name='lugar de expedición')),
                ('fechaexpedicion', models.DateField(blank=True, null=True, verbose_name='Fehca de expedición')),
                ('direccion', models.CharField(blank=True, max_length=150, null=True, verbose_name='Direccion')),
                ('telefono', models.CharField(blank=True, max_length=50, null=True, verbose_name='Telefono fijo')),
                ('telefonomovil', models.CharField(blank=True, max_length=10, verbose_name='Telefono movil')),
                ('telefonowhatsapp', models.CharField(blank=True, max_length=50, null=True)),
                ('email', models.CharField(blank=True, max_length=50, null=True, verbose_name='Email')),
                ('sendemail', models.BooleanField(default=False, null=True, verbose_name='Enviar email')),
                ('fechanacimiento', models.DateField(blank=True, null=True, verbose_name='Fecha nacmiento')),
                ('nombre', models.CharField(blank=True, max_length=50, verbose_name='nombre')),
                ('segundonombre', models.CharField(blank=True, max_length=50, null=True, verbose_name='segundo nombre')),
                ('apellido', models.CharField(blank=True, max_length=50, verbose_name='apellido')),
                ('segundoapellido', models.CharField(blank=True, max_length=50, null=True, verbose_name='segundo apellido')),
                ('foto', models.TextField(blank=True, null=True)),
                ('barrio', models.CharField(blank=True, max_length=100, null=True)),
                ('observaciones', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('deleted_by', models.BigIntegerField(blank=True, null=True)),
                ('ciudad', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_ciudad', to='mensajeria.maestras')),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='personas_created_by', to=settings.AUTH_USER_MODEL)),
                ('departamento', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_departamento', to='mensajeria.maestras')),
                ('ocupacion', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_ocupacion', to='mensajeria.maestras')),
                ('pais', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_pais', to='mensajeria.maestras')),
                ('sexo', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_sexo', to='mensajeria.maestras')),
                ('tipoidentificacion', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_tipoidentificacion', to='mensajeria.maestras')),
                ('updated_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_updated_by', to=settings.AUTH_USER_MODEL)),
                ('zona', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='personas_zona', to='mensajeria.maestras')),
            ],
            options={
                'verbose_name': 'persona',
                'verbose_name_plural': 'personas',
                'db_table': 'personas',
            },
        ),
        migrations.CreateModel(
            name='Modulos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=191, null=True)),
                ('path', models.CharField(blank=True, max_length=191, null=True)),
                ('icon', models.CharField(blank=True, max_length=191, null=True)),
                ('order', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('deleted_by', models.BigIntegerField(blank=True, null=True)),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='modulos_created_by', to=settings.AUTH_USER_MODEL)),
                ('dad', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modulos_children', to='mensajeria.modulos')),
                ('estado', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modulos_estado', to='mensajeria.maestras')),
                ('updated_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modulos_updated_by', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'modulos',
            },
        ),
        migrations.CreateModel(
            name='Mensajeria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mensaje_id', models.CharField(max_length=100)),
                ('recipiente_id', models.CharField(max_length=100)),
                ('conversacion_id', models.CharField(max_length=100)),
                ('origin', models.CharField(max_length=100)),
                ('timestamp', models.CharField(max_length=100)),
                ('celular', models.CharField(max_length=12)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='mensajeria_created_by', to=settings.AUTH_USER_MODEL)),
                ('estado', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='mensajeria_estado', to='mensajeria.maestras')),
                ('updated_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='mensajeria_updated_by', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'mensajeria',
                'verbose_name_plural': 'mensajeria',
                'db_table': 'mensajeria',
            },
        ),
        migrations.AddField(
            model_name='destinatarios',
            name='persona',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Personas_destinatarios_persona', to='mensajeria.personas'),
        ),
    ]
