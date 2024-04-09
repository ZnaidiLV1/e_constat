from django.db import models


class Assure(models.Model):
    numr_tlfn = models.IntegerField(primary_key=True)
    email_user=models.CharField(max_length=100, blank=True, null=True, default=None)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    num_permis = models.IntegerField()
    numr_tlfn_autre_assure=models.IntegerField(default=0)

class Conducteur(models.Model):
    assure = models.ForeignKey(Assure, on_delete=models.CASCADE, related_name='conductor')
    numr_tlfn = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    num_permis = models.IntegerField()

class Constat(models.Model):
    id_constat = models.AutoField(primary_key=True)
    assure = models.IntegerField()

class Accident(models.Model):
    constat = models.OneToOneField(Constat, on_delete=models.CASCADE, related_name='accident')
    lieu_accident = models.CharField(max_length=255)
    date_accident = models.DateField()

class Degat(models.Model):
    accident = models.OneToOneField(Accident, on_delete=models.CASCADE, related_name='degat')
    photo = models.ImageField(upload_to='degat_photos/', blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    peinture = models.ImageField(upload_to='peinture_photos/', blank=True, null=True)

class Voiture(models.Model):
    constat = models.ForeignKey(Constat, on_delete=models.CASCADE, related_name='voiture')
    carte_grise = models.IntegerField(primary_key=True)
    immatriculation = models.IntegerField()
    marque = models.CharField(max_length=100)
    type = models.CharField(max_length=100)

# Create your models here.
