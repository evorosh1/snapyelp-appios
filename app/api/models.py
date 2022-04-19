from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField(null=True)
    #Friends
    #profilePic = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, **options)
    # profile_photo = models.ImageField(max_length=None, use_url=True, allow_null=True, required=False)
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



# @receiver(post_save, sender=settings.AUTH_USER_MODEL)
# def create_auth_token(sender, instance=None, created=False, **kwargs):
#     if created:
#         Token.objects.create(user=instance)