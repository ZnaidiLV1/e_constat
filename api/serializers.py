from rest_framework.serializers import ModelSerializer
from . import models
from rest_framework import serializers
from django.contrib.auth.models import User
class assureSerializer(ModelSerializer):
    class Meta:
        model=models.Assure
        fields='__all__'

class conductorSerializer(ModelSerializer):
    class Meta:
        model=models.Conducteur
        fields='__all__'

class voitureSerializer(ModelSerializer):
    class Meta:
        model=models.Voiture
        fields='__all__'
class constatSerializer(ModelSerializer):
    class Meta:
        model=models.Constat
        fields='__all__'

class accidentSerilizer(ModelSerializer):
    class Meta:
        model=models.Accident
        fields='__all__'

class UserCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user