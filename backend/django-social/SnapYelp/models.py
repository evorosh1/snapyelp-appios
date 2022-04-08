from django.db import models
from datetime import date

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