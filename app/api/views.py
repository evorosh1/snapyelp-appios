from .models import UserProfile
from .serializers import UserProfileSerializer, LoginSerializer, RegisterSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions

# Create your views here.

class ListUserDetails(APIView):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = UserProfile.objects.filter(user=request.user).first()
        return Response(user)

class Login(APIView):
    def post(self, request):
        # username = request.data.user['username']
        # password = request.data['password']

        # user = UserProfile.objects.filter(username=request.data).first()
        # serializer = LoginSerializer(data=request.data)
        # if serializer.is_valid():
        pass
            

class Register(APIView):
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            content = {
                'details': 'registration successful',
            }
            content += serializer.data
            return Response(content, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)