from rest_framework import serializers

class DestinariosSerializers(serializers.Serializer):
    persona           = serializers.IntegerField()
    estado            = serializers.IntegerField()
    created_by        = serializers.IntegerField()
    created_at        = serializers.DateTimeField(auto_now_add=True)
    updated_by        = serializers.ForeignKey('auth.User', related_name='Destinatarios_updated_by', null=True, on_delete=models.CASCADE)
    updated_at        = serializers.DateTimeField(auto_now=True)

