from __future__ import unicode_literals

from django.db import models
from app.settings import LANGUAGE_CODE

class Language:
    ENGLISH = 'en'
    CHINESE = 'zh'
    
    LANGUAGES = (
        (ENGLISH, 'English'),
        (CHINESE, 'Chinese'),
    )
    
class Page(models.Model):
    name = models.CharField(max_length=32, unique=True, blank=True, null=True)
    
    class Meta:
        db_table = 'page'
        ordering = ['name']
        
    def __unicode__(self):
        return self.name
    
class Block(models.Model):
    LANGUAGE_CHOICE = Language.LANGUAGES
    
    code = models.CharField(max_length=64, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    locale = models.CharField(max_length=2,
                                      choices=LANGUAGE_CHOICE,
                                      default=LANGUAGE_CODE)
    page = models.ForeignKey('Page', related_name='blocks', null=True)
    
    class Meta:
        db_table = 'block'
        ordering = ['code']
        
    def __unicode__(self):
        return self.code