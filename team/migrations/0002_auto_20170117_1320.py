# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-01-17 13:20
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('team', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='team',
            options={'ordering': ['id']},
        ),
        migrations.AddField(
            model_name='player',
            name='birth_year',
            field=models.IntegerField(default=1988),
        ),
    ]
