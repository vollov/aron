from django.test import TestCase

###############################################
## test serializers
###############################################
class TestPlayerSerializers(TestCase):
    fixtures = ['auth.json', 'team.json']
    
    