from django.urls import path
from .views import ProfileDetails, Login, Register, Logout

urlpatterns = [
    path('login/', Login.as_view(), name='login'),
    path('register/', Register.as_view(), name='register'),
    path('account/user/', ProfileDetails.as_view(), name='user'),
    path('logout/', Logout.as_view(), name='logout'),
]