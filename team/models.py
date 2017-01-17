from __future__ import unicode_literals

from django.db import models

from accounts.models import Account

class Team(models.Model):
    
    name = models.CharField(max_length=32, unique=True, blank=True, null=True)
    city = models.CharField(max_length=32, blank=True, null=True)
    
    active = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True, editable = True)
    
    class Meta:
        db_table = 'team'

class Player(models.Model):
    
    account = models.OneToOneField(Account, null=True)
    active = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True, editable = True)
    team = models.ForeignKey(Team, null=True)
    number = models.IntegerField(default=0, blank=False, null=False)
    
    def __unicode__(self):
        user = self.account
        if self.number:
            number = str(self.number)
        else:
            number = 'n/a'
        return user.last_name + ' ' +user.first_name + '(' + number + ') ' + self.team.city
    
    def is_captain(self):
        return self.account.groups.filter(name='captain').exists()

    def is_coach(self):
        return self.account.groups.filter(name='coach').exists()
        
    class Meta:
        db_table = 'player'

    def full_name(self):
        user = self.user_profile.user
        return user.last_name + '.' +user.first_name