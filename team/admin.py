from django.contrib import admin
from models import Team, Player

class TeamAdmin(admin.ModelAdmin):
    model = Team
    
admin.site.register(Team, TeamAdmin)

class PlayerAdmin(admin.ModelAdmin):
    model = Player
    
admin.site.register(Player, PlayerAdmin)