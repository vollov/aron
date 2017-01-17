from django.contrib import admin
from models import Team, Player

class TeamAdmin(admin.ModelAdmin):
    model = Team
    list_display = ['id','name','city', 'active', 'created']
    
admin.site.register(Team, TeamAdmin)

class PlayerAdmin(admin.ModelAdmin):
    model = Player
    list_display = ['id','full_name','team', 'number', 'birth_year']
    
admin.site.register(Player, PlayerAdmin)