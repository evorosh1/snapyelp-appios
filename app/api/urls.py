from django.urls import path
from .views import ListUserDetails, Login, Register

urlpatterns = [
    path('api/login', Login.as_view()),
    path('api/register', Register.as_view()),
    path('api/user', ListUserDetails.as_view()),
]