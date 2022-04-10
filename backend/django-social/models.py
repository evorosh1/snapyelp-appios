from django.db import models
from datetime import date
from django.apps import AppConfig
from requests import Response
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from rest_framework import status
from django.contrib.auth.hashers import make_password

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=50)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=100)
    email = models.EmailField()
    Bio = models.TextField()
    #Friends
    #profilePic = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, **options)
    #time = models.DateTimeField(auto_now_add=True)
    #public = models.BinaryField()
    def __str__(self):
        return self.username
        
class Post(models.Model):
    Title = models.CharField(max_length=50)
    Description = models.TextField()
    URL = models.SlugField(max_length=40)
    #profilePic = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, **options)
    time = models.DateTimeField(auto_now_add=True)
    #user

class Register(APIView):
     def post(self, request):
        # The order of required params is important as they are used to set variables by index
        required_params = ['username', 'password', 'email']
        try:
            data = request.data
            # Checking if all the required parameters are available in data
            if all(key in data for key in required_params):
                try:
                    user_name = self.validate_required_input(required_params[0], data[required_params[0]])
                    password = self.validate_required_input(required_params[1], data[required_params[1]])
                    email = self.validate_required_input(required_params[2], data[required_params[2]])
                except ValidationError as er:
                    return Response({"error": str(er.messages[0])}, status=status.HTTP_400_BAD_REQUEST)

                # Input is now considered valid
                # Creating user object to store to DB
                new_user = User()
                new_user.username = user_name
                new_user.password = make_password(password)
                new_user.email = email

                # Trying to set optional parameters if available
                try:
                    new_user.first_name = data['firstname'] if data['firstname'] is not None else ""
                except KeyError:
                    print("Error while parsing firstname ")
                try:
                    new_user.last_name = data['lastname'] if data['lastname'] is not None else ""
                except KeyError:
                    print("Error while parsing lastname")

                new_user.save()

                return Response({"status": "Success"}, status=status.HTTP_201_CREATED)

            else:
                return Response({"error": "Required param(s) missing, Please include and retry again"},
                                status=status.HTTP_400_BAD_REQUEST)
        except Exception as exp:
            print("Unexpected exception occurred: "+str(exp))
            return Response({"error": "Unexpected error occurred, please report this to Admin"},
                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)