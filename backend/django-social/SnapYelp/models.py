from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=50)
    password = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    UserID = models.CharField(max_length=100)
    Bio = models.CharField(max_length=500)
    #Friends = models.charfield(max_length=100)
    #profilePic = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, **options)
    #time = models.DateTimeField(auto_now_add=True)
    #public = models.BinaryField()
    def __str__(self):
        return self.name