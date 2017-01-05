
from rest_framework import serializers
from models import Page, Block

class BlockSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Block
        fields = ('id', 'code', 'content', 'locale')
        
class PageSerializer(serializers.ModelSerializer):
    blocks = BlockSerializer(read_only=False, many=True)
    
    class Meta:
        model = Page
        fields = ('id', 'name', 'blocks')
        





