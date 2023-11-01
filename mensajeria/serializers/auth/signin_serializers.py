from rest_framework import serializers
from django.contrib.auth import authenticate
from rest_framework.validators import ValidationError


class SigninSerializers(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, attrs):
        user = authenticate(**attrs)

        if user and user.is_authenticated and user.is_active:
            return user

        raise ValidationError("Username or password incorrect!")
