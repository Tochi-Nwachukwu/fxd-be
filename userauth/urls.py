from django.urls import path
from .views import Index,register_profile


urlpatterns = [
    path("", Index.as_view(), name="index"),
    path("api/register/", register_profile, name="register-profile"),
]


from django.urls import path
from .views import register_profile

urlpatterns = [
    path("api/register/", register_profile, name="register-profile"),
]
