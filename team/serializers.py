
from rest_framework import serializers

from models import Team, Player

class TeamSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Team
        fields = ('id', 'name', 'city')
        
class PlayerSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Player
        fields = ('id', 'account', 'team', 'number')
        





