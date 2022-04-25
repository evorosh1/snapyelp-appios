from django.urls import path
from .views import ProfileDetails, Login, Register, Logout

urlpatterns = [
    path('login/', Login.as_view()),
    path('register/', Register.as_view()),
    path('account/user/', ProfileDetails.as_view()),
    path('logout/', Logout.as_view()),
]