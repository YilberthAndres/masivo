from django.urls import path
from .auth import Signup, Signin

app_name = "masiva-auth"

urlpatterns = [
    path("signup/", Signup.as_view(), name="signup"),
    path("signin/", Signin.as_view(), name="lognout"),
]