from django.test import TestCase

from rest_framework.test import APIClient
from django.contrib.auth import authenticate
from app.settings import API_PATH
###############################################
## test user registration 
###############################################
class TestUserAuthentication(TestCase):
    fixtures = ['accounts.json',]
     
    def test_registration(self):
         
        client = APIClient()
         
        user = {'username': 'martin',
             'first_name': 'Martin',
             'last_name': 'Bright',
             'email':'martin@abc.com',
             'password':'pwd123',
             'confirm_password':'pwd123',
             'birth_year':1983}
        response = client.post('/' + API_PATH + 'register', user, format='json')
        assert response.status_code == 201
 
    def test_authenticate_with_username(self):
        user = authenticate(username='admin', password='justdoit')
        self.assertIsNone(user, msg='authenticate with email should return None')
         
    def test_authenticate_with_email(self):
        user = authenticate(email='admin@ocbl.ca', password='justdoit')
        self.assertIsNotNone(user, msg='authenticate with email should return user')
             
    def test_login(self):
        client = APIClient()
        user = {'email':'admin@ocbl.ca',
                'password': 'justdoit'}
         
        response = client.post('/' + API_PATH + 'login', user, format='json')
        assert response.status_code == 200

class TestAccountAccess(TestCase):
    fixtures = ['accounts.json',]
    
    def test_fetch_account_by_owner(self):
        client = APIClient()
        user = {'email':'admin@ocbl.ca',
                'password': 'justdoit'}
        # admin:justdoit
        # kate:justdoit
        response = client.post('/' + API_PATH + 'login', user, format='json')
        assert response.status_code == 200

#         response = client.get('/' + API_PATH + 'accounts/admin')
# #         print 'response ===> {0}'.format(response.data)
#         assert response.status_code == 200
        