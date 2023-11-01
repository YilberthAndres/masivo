from rest_framework import serializers
from ...models import User
from rest_framework.validators import ValidationError, UniqueValidator


class SignupSerializers(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    password2 = serializers.CharField()

    class Meta:
        fields = "__all__"

    def validate(self, attrs):
        if attrs["password"] != attrs["password2"]:
            raise ValidationError("Password don't match")
        return attrs

    def create(self, validated_data):
        
            user = User.objects.create_user(
                username=validated_data["username"], password=validated_data["password"]
            )

            return user
