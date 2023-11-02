from rest_framework import serializers


class TemplateSerializers(serializers.Serializer):
    template = serializers.ListSerializer()
    body = serializers.ListSerializer()
