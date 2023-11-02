from rest_framework.generics import CreateAPIView, GenericAPIView
from ...serializers.auth.signup_serializers import SignupSerializers
from ...serializers.auth.signin_serializers import SigninSerializers
from rest_framework.response import Response
from rest_framework import status
from ...mixins.base import ResponseMixin
from rest_framework_simplejwt.tokens import RefreshToken


class Signup(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)

        if not serializer.is_valid():
            self.error = {
                "errors": serializer.errors,
                "status": status.HTTP_400_BAD_REQUEST,
                "valid": False,
            }
            return Response(self.response_obj)

        try:
            serializer.save()
            self.data = {"status": status.HTTP_200_OK, "data": "Ok", "valid": True}
        except Exception as e:
            self.error = {
                "errors": e.args,
                "status": status.HTTP_400_BAD_REQUEST,
                "valid": False,
            }

        return Response(self.response_obj)


class Signin(GenericAPIView, ResponseMixin):
    serializer_class = SigninSerializers

    def get_tokens_for_user(self, user):
        refresh = RefreshToken.for_user(user)
        return {
            "refresh": str(refresh),
            "access": str(refresh.access_token),
        }

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)

        if not serializer.is_valid():
            self.error = {
                "errors": serializer.errors,
                "status": status.HTTP_400_BAD_REQUEST,
                "valid": False,
            }
            return Response(self.response_obj)

        user = serializer.validated_data

        token = self.get_tokens_for_user(user)
        self.data = {"status": status.HTTP_200_OK, "data": token, "valid": True}

        return Response(self.response_obj)
