from rest_framework import serializers
from mensajeria.models import Areas, Secciones, Grupos


class GruposSerializer(serializers.Serializer):
    id              = serializers.PrimaryKeyRelatedField(read_only=True)
    nombre          = serializers.PrimaryKeyRelatedField(read_only=True)
    descripcion     = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_id       = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_nombre   = serializers.ReadOnlyField(source='estado.nombre')
    seccion_id      = serializers.PrimaryKeyRelatedField(read_only=True)
    seccion_nombre  = serializers.ReadOnlyField(source='seccion.nombre')
    # created_at      = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    created_by      = serializers.ReadOnlyField(source='created_by.id')

    class Meta:
        model = Grupos
    

class SeccionesSerializer(serializers.Serializer):
    id              = serializers.PrimaryKeyRelatedField(read_only=True)
    nombre          = serializers.PrimaryKeyRelatedField(read_only=True)
    descripcion     = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_id       = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_nombre   = serializers.ReadOnlyField(source='estado.nombre')
    area_id         = serializers.PrimaryKeyRelatedField(read_only=True)
    area_nombre     = serializers.ReadOnlyField(source='area.nombre')
    # created_at      = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    created_by      = serializers.ReadOnlyField(source='created_by.id')
    grupos_set      = GruposSerializer(read_only=True, many=True)

    class Meta:
        model = Secciones

class AreasSerializer(serializers.Serializer):
    id              = serializers.PrimaryKeyRelatedField(read_only=True)
    nombre          = serializers.PrimaryKeyRelatedField(read_only=True)
    descripcion     = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_id       = serializers.PrimaryKeyRelatedField(read_only=True)
    estado_nombre   = serializers.ReadOnlyField(source='estado.nombre')
    # created_at      = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    created_by      = serializers.ReadOnlyField(source='created_by.id')
    secciones_set   = SeccionesSerializer(read_only=True, many=True)

    class Meta:
        model = Areas