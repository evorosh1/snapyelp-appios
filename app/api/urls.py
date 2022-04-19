from django.urls import path
from .views import ListUserDetails, Login, Register, Logout

urlpatterns = [
    path('login/', Login.as_view()),
    path('register/', Register.as_view()),
    path('user/', ListUserDetails.as_view()),
    path('logout/', Logout.as_view()),
]