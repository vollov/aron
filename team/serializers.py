from django.contrib.auth.models import User, Group
from rest_framework import serializers

from models import Team, Player

class UserSerializer(serializers.ModelSerializer):

    password = serializers.CharField(write_only=True, required=False)
    confirm_password = serializers.CharField(write_only=True, required=False)
    
    class Meta:
        model = User
        fields = ('pk', 'url', 'username','password', 'email', 'groups')


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')


class TeamSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Team
        fields = ('id', 'name', 'city')
        
class PlayerSerializer(serializers.ModelSerializer):
    """
    player = { ^user, 'birth_year'}
    user = {'id', 'email', 'username', 'is_active', 'first_name', 'last_name'}
    """
    
    user = UserSerializer()
    
    class Meta:
        model = Player
        fields = ('id', 'user', 'team', 'number', 'birth_year')
        
#     def create(self, validated_data):
#         user_data = validated_data.pop('user')
#         user = User.objects.create(user_data)
#         Player.objects.create()
        





