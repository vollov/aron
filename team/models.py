from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import User, Group

class Team(models.Model):
    
    name = models.CharField(max_length=32, unique=True, blank=True, null=True)
    city = models.CharField(max_length=32, blank=True, null=True)
    
    active = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True, editable = True)
    
    class Meta:
        db_table = 'team'
        ordering = ['id']

    def __unicode__(self):
        return self.name
    
class Player(models.Model):
    
    user = models.OneToOneField(User, null=True)
    active = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True, editable = True)
    team = models.ForeignKey(Team, null=True)
    number = models.IntegerField(default=0, blank=False, null=False)
    birth_year = models.IntegerField(default=1988, blank=False, null=False)
    
    class Meta:
        db_table = 'player'
        
    def __unicode__(self):
        if self.number:
            number = str(self.number)
        else:
            number = 'n/a'
        return self.user.last_name + ' ' +self.user.first_name + '(' + number + ') ' + self.team.city
    
    def is_captain(self):
        return self.user.groups.filter(name='captain').exists()

    def is_coach(self):
        return self.user.groups.filter(name='coach').exists()
    
    def full_name(self):
        return self.user.last_name + '.' + self.user.first_name