from django.shortcuts import render

from rest_framework import permissions, viewsets, status, views
from models import Page, Block
from serializers import PageSerializer, BlockSerializer
from app.permissions import IsAccountOwner

class PageViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Page.objects.all()
    serializer_class = PageSerializer #(queryset, many=True)
    lookup_field = 'name'
    
    def get_permissions(self):
        if self.request.method == 'GET':
            return permissions.AllowAny(),
        return permissions.IsAuthenticated(), IsAccountOwner()
    
class BlockViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Block.objects.all()
    serializer_class = BlockSerializer #(queryset, many=True)
    
    def get_permissions(self):
        if self.request.method == 'GET':
            return permissions.AllowAny(),
        return permissions.IsAuthenticated(), IsAccountOwner()