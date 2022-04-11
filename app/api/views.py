from .models import Profile
from .serializers import ProfileSerializer, LoginSerializer, RegisterSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from django.contrib.auth.models import User
from rest_framework import status

# Create your views here.

class ListUserDetails(APIView):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = Profile.objects.filter(user=request.user).first()
        return Response(user)

class Login(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            return Response(serializer.data, status=status.HTTP_200_OK)
            # username = request.data['username']
            # password = request.data['password']
            # user = User.objects.filter(username=username).first()

            # if user:
            #     if password == user.password:
            #         return Response({'details': 'login successful'}, status=status.HTTP_200_OK)
            #     else: 
            #         return Response({'details': 'incorrect password'}, status=status.HTTP_401_UNAUTHORIZED)
            # else: 
            #     return Response({'details': 'account does not exist'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Register(APIView):
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            # user = User.objects.filter(username=request.data['username']).first()
            # profile_serializer = ProfileSerializer(data=user)
            # if profile_serializer.is_valid():
            #     profile_serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
            # return Response(profile_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# { 
# {
# "username": "test",
# "password": "test123!",
# "email": "test@test.com"
# }
# }

# {"username":"test", "password":"test123!"}