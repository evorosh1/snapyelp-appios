from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField()
    profile_photo = models.CharField(max_length=100) # all photos will be sent to server as a base64 encoded string
    #time = models.DateTimeField(auto_now_add=True)
    #public = models.BinaryField()
    # def __str__(self):
    #     return self.username
        
# class Post(models.Model):
#     Title = models.CharField(max_length=50)
#     Description = models.TextField()
#     URL = models.SlugField(max_length=40)
#     #profilePic = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, **options)
#     time = models.DateTimeField(auto_now_add=True)
#     # creates the relationship between the posts and the user
#     user_profile = models.ForeignKey(Profile, on_delete=models.CASCADE)

