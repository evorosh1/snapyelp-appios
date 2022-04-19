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

class ListUserDetails(APIView):
    def get(self, request):
        token = request.COOKIES.get('token')
        if not token:
            raise AuthenticationFailed
        user = Token.objects.get(key=str(token)).user
        profile = Profile.objects.filter(user=user).first()
        serializer = ProfileSerializer(profile)
        return Response(serializer.data, status=status.HTTP_200_OK)

class Login(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            user = User.objects.filter(username=request.data["username"]).first()
            token = Token.objects.get(user=user)
            response = Response()
            response.set_cookie(key='token', value=token, httponly=True)
            response.data = {'msg':'login successful', 'token':token.key, **serializer.data}
            response.status = status.HTTP_200_OK
            return response
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Register(APIView):
    def post(self, request):
        request.data['profile'] = {}
        print(request.data)
        serializer = RegisterSerializer(data=request.data)
        print(serializer)
        if serializer.is_valid():
            user = serializer.save()
            token = Token.objects.create(user=user)
            return Response({**serializer.data, 'token':token.key}, status=status.HTTP_201_CREATED)
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