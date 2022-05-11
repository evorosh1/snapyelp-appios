from django.test import TestCase
from faker import Faker
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Profile
from django.contrib.auth.models import User
import random
from rest_framework.test import APIRequestFactory
from .views import Register

# Create your tests here.

class UserSignTestCase(APITestCase):
    def setUp(self):
        self.fake = Faker()
        self.first_name = self.fake.first_name()
        self.username = self.first_name + str(random.randint(1, 100))
        self.pw = self.fake.password(length=10, special_chars=False)

    def test_registration(self):
        """
        Ensure user registration works.
        """

        data = {
            'username': self.username, 
            'first_name': self.first_name, 
            'last_name': self.fake.last_name(), 
            'email': self.fake.email(), 
            'password': self.pw, 
            'confirm_password': self.pw,
        }
        
        url = reverse('register')
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(User.objects.get().username, self.username)
        self.assertEqual(Profile.objects.get().user.username, self.username)
        self.assertEqual(Profile.objects.get().bio, "")


class UserLoginAndLogoutTestCase(APITestCase): 
    def setUp(self):
        self.fake = Faker()
        self.first_name = self.fake.first_name()
        self.username = self.first_name + str(random.randint(1, 100))
        self.pw = self.fake.password(length=10, special_chars=False)

        self.new_user = User.objects.create_user(
            username=self.username,
            first_name=self.first_name,
            last_name=self.fake.last_name(),
            email=self.fake.email(),
            password=self.pw
        )

    def test_login(self):
        """
        Ensure login works.
        """
        
        response = self.client.login(username=self.username, password=self.pw)
        self.assertEqual(response, True)

    def test_logout(self):
        """
        Ensure logout works.
        """

        url = reverse('logout')
        response = self.client.post(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['msg'], 'logout successful')
