from django.contrib.auth.models import Group
from rest_framework import serializers
from django.contrib.auth import update_session_auth_hash
from models import Account

# class GroupSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Group
#         fields = ('id', 'name')
        
class AccountSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=False)
    confirm_password = serializers.CharField(write_only=True, required=False)
#     groups = GroupSerializer(read_only=False, many=True)
    
    class Meta:
        model = Account
        fields = ('id', 'email', 'username', 'created_at', 'updated_at',
                  'first_name', 'last_name', 'birth_year', 'password',
                  'confirm_password')
        read_only_fields = ('created_at', 'updated_at',)

    def create(self, validated_data):
        return Account.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.username = validated_data.get('username', instance.username)
        instance.birth_year = validated_data.get('birth_year', instance.tagline)
        instance.save()

        password = validated_data.get('password', None)
        confirm_password = validated_data.get('confirm_password', None)

        if password and confirm_password:
            if password == confirm_password:
                instance.set_password(password)
                instance.save()
            else:
                raise serializers.ValidationError({"password": ["Passwords don't match."]})

        update_session_auth_hash(self.context.get('request'), instance)

        return instance
    



