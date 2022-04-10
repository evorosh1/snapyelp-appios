from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField()
    # profile_photo = models.ImageField()
    # ImageField(max_length=None, use_url=True, allow_null=True, required=False)

# class Post(models.Model):
#     # create relationship between the posts and the user
#     user_profile = models.ForeignKey(UserProfile, on_delete=models.CASCADE)


