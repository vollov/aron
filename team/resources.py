from tastypie.resources import ModelResource
from models import Team, Player
from tastypie.serializers import Serializer

class TeamResource(ModelResource):
    class Meta:
        queryset = Team.objects.all()
        resource_name = 'team'
        serializer = Serializer(formats=['json',])
        
from django.contrib.auth.models import User, Group

class GroupResource(ModelResource):
    class Meta:
        queryset = Group.objects.all()
        resource_name = 'group'
        serializer = Serializer(formats=['json',])

from tastypie import fields
from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS

class UserResource(ModelResource):
#     groups = fields.ForeignKey(GroupResource, 'groups')
    groups = fields.ManyToManyField(GroupResource, 'groups', null=True, full=True)
    
    class Meta:
        queryset = User.objects.all()
        resource_name = 'user'
        excludes = ['email', 'password', 'is_superuser']
        serializer = Serializer(formats=['json',])
        
class PlayerResource(ModelResource):
#     groups = fields.ForeignKey(GroupResource, 'groups')
#     groups = fields.ManyToManyField(GroupResource, 'groups', null=True, full=True)
    
    class Meta:
        queryset = Player.objects.all()
        resource_name = 'player'
        serializer = Serializer(formats=['json',])
        