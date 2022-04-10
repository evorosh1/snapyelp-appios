from .models import UserProfile
from rest_framework import serializers

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'

class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['username', 'password']

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']