from .models import Profile
from rest_framework import serializers
from django.contrib.auth.models import User

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = '__all__'
        extra_kwargs = {'bio': {'required': False}}

class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'password']
        extra_kwargs = {"username": {"validators": [],},
    }

    def validate(self, data):
        username = data['username']
        password = data['password']
        existing = User.objects.filter(username=username).first()
        if existing:
            if password == existing.password:
                return data
            raise serializers.ValidationError("incorrect password")
        raise serializers.ValidationError("user does not exist")

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password']
        extra_kwargs = {'first_name': {'required': False}, 'last_name': {'required': False}}

    def validate_email(self, email):
        existing = User.objects.filter(email=email).first()
        if existing:
            raise serializers.ValidationError("A user with that email already exists")
        return email
    
    # def validate(self, data):
    #     if not data.get('password1') or not data.get('password2'):
    #         raise serializers.ValidationError("both password fields required")
    #     if data.get('password1') != data.get('password2'):
    #         raise serializers.ValidationError("passwords don't match.")
    #     return data