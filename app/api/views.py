import profile
from .models import Profile
from .serializers import LoginSerializer, ProfileSerializer, RegisterSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from django.contrib.auth.models import User
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import AuthenticationFailed

# Create your views here.

class ProfileDetails(APIView):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    
    def get(self, request):
        token = request.COOKIES.get('token')
        if not token:
            raise AuthenticationFailed
        user = Token.objects.get(key=str(token)).user
        profile = Profile.objects.filter(user=user).first()
        serializer = ProfileSerializer(profile)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def patch(self, request):
        # get the token
        token = request.COOKIES.get('token')
        if not token:
            raise AuthenticationFailed
        # find the user
        user = Token.objects.get(key=str(token)).user
        # get the user's profile
        profile = Profile.objects.filter(user=user).first()
        print(profile.user)

        serializer = ProfileSerializer(profile, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Login(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            user = User.objects.filter(username=request.data["username"]).first()
            token = Token.objects.get(user=user)
            response = Response()
            response.set_cookie(key='token', value=token, httponly=True)
            response.data = {'msg':'login successful', 'token':token.key}
            response.status = status.HTTP_200_OK
            return response
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Register(APIView):
    def post(self, request):
        request.data['profile'] = {}
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.create(user=user)
            response = Response()
            response.set_cookie(key='token', value=token, httponly=True)
            response.data = {'msg':'login successful', 'token':token.key}
            response.status = status.HTTP_201_CREATED
            return response
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Logout(APIView):
    def post(self, request):
        response = Response()
        response.delete_cookie('token')
        response.data = {'msg':'logout successful'}
        return response

# { 
# {
# "first_name": "sam",
# "last_name": "smith",
# "username": "test",
# "password": "test123!",
# "confirm_password": "test123!",
# "email": "test@test.com",
# "profile": {}
# }
# }

# {"username":"test", "password":"test123!"}
# {"bio":"I love to code!", "profile_photo":"test"}