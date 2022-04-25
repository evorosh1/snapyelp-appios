from .models import Profile
from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.exceptions import NotAuthenticated, AuthenticationFailed
from django.contrib.auth import authenticate

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['user', 'bio', 'profile_photo']
        extra_kwargs = {'user': {'required': False}, 'bio': {'required': False}, 'profile_photo': {'required': False},}

    def update(self, instance, validated_data):
        instance.profile_photo = validated_data.get('profile_photo', instance.profile_photo)
        instance.bio = validated_data.get('bio', instance.bio)
        instance.save()
        return instance

class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'password']
        extra_kwargs = {"username": {"validators": []}, 'password': {'write_only': True}}

    def validate(self, data):
        username = data.get("username")
        password = data.get("password")
        if username and password:
            user = authenticate(username=username, password=password)
            if not user:
                raise AuthenticationFailed
            return user
        raise NotAuthenticated

class RegisterSerializer(serializers.ModelSerializer):
    profile = ProfileSerializer(required=False)
    confirm_password = serializers.CharField(required=True, write_only=True)
    
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password', 'confirm_password', 'profile']
        extra_kwargs = {'password': {'write_only': True},}

    def validate_email(self, email):
        existing = User.objects.filter(email=email).first()
        if existing:
            raise serializers.ValidationError("A user with that email already exists")
        return email

    def validate(self, data):
        if not data.get('password') or not data.get('confirm_password'):
            raise serializers.ValidationError("both password fields required")
        if data.get('password') != data.get('confirm_password'):
            raise serializers.ValidationError("passwords don't match.")
        return data

    def create(self, validated_data):
        # create and save new user
        user = User(
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            email=validated_data['email'],
            username=validated_data['username'],
        )
        user.set_password(validated_data['password'])
        user.save()

        # create profile
        profile_data = validated_data.pop('profile')
        Profile.objects.create(user=user, **profile_data)
        
        return user
