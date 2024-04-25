import os

from django.conf import settings
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework_simplejwt.tokens import RefreshToken
from . import serializers
from . import models
from .serializers import UserCreateSerializer
from django.shortcuts import get_object_or_404
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


@api_view(['GET'])
def get_routes(request):
    routes = [
        {
            'Endpoint': '/assure/',
            'method': 'POST',
            'body': {"first_name": "", "last_name": "", "num_permis": "", "email": "", "password": ""},
            'description': 'create new assure'
        },
        {
            'Endpoint': '/conductor/',
            'method': 'POST',
            'body': {"first_name": "", "last_name": "", "num_permis": "", "email": "", "password": ""},
            'description': 'create a new conductor'
        },
    ]
    return Response(routes)


@api_view(['POST'])
def create_assure(request):
    data = request.data
    n_tlfn = int(data['numr_tlfn'])
    n_permis = int(data['num_permis'])
    assure = models.Assure.objects.create(
        first_name=data['first_name'],
        last_name=data['last_name'],
        email_user=data['email_user'],
        numr_tlfn=n_tlfn,
        num_permis=n_permis,
    )
    serializer = serializers.assureSerializer(assure, many=False)

    return Response(serializer.data)


@api_view(['GET'])
def get_assure(request):
    assure = models.Assure.objects.all()
    serializer = serializers.assureSerializer(assure, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def get_assure_x(request, email_assure):
    assure = models.Assure.objects.filter(email_user=email_assure)
    serializer = serializers.assureSerializer(assure, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_assure_wanted(request, numr_tlfn):
    assure = models.Assure.objects.filter(numr_tlfn=numr_tlfn)
    serializer = serializers.assureSerializer(assure, many=True)
    return Response(serializer.data)
@api_view(['POST'])
def create_conductor(request, id_assure):
    data = request.data
    a = get_object_or_404(models.Assure, numr_tlfn=id_assure)
    print("Received JSON data:", request.data)
    n_permis = int(data['num_permis'])
    n_tlfn = int(data['numr_tlfn'])
    conductor = models.Conducteur.objects.create(
        assure=a,
        numr_tlfn=n_tlfn,
        first_name=data['first_name'],
        last_name=data['last_name'],
        num_permis=n_permis,
    )
    serializer = serializers.conductorSerializer(conductor, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def get_conducteur(request, id_assure):
    data = request.data
    assure = get_object_or_404(models.Assure, numr_tlfn=id_assure)
    conducteurs = models.Conducteur.objects.filter(assure=assure)
    serializer = serializers.conductorSerializer(conducteurs, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def create_constat(request, id_assure):
    data = request.data
    num_t = int(data["numr_tlfn_autre_assure"])
    constat = models.Constat.objects.create(
        assure=id_assure,
        numr_tlfn_autre_assure=num_t
    )
    serializer = serializers.constatSerializer(constat, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def get_constat_u_want(request, id_con):
    constat = models.Constat.objects.get(assure=id_con)
    serializer = serializers.constatSerializer(constat, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def get_constats(request, id_assure):
    constats = models.Constat.objects.filter(assure=id_assure)
    serializer = serializers.constatSerializer(constats, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def create_voiture(request, id_constat):
    data = request.data
    imm = int(data["immatriculation"])
    constat = get_object_or_404(models.Constat, id_constat=id_constat)
    voiture = models.Voiture.objects.create(
        constat=constat,
        type=data["type"],
        marque=data["marque"],
        immatriculation=imm,
        carte_grise=data["carte_grise"],
    )
    serializer = serializers.voitureSerializer(voiture, many=False)
    return Response(serializer.data)


@api_view(["POST"])
def create_accident(request, id_constat):
    data = request.data
    constat = get_object_or_404(models.Constat, id_constat=id_constat)
    accident = models.Accident.objects.create(
        constat=constat,
        date_accident=data["date_accident"],
        lieu_accident=data["lieu_accident"]
    )
    serializer = serializers.accidentSerilizer(accident, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def get_accident_ya_zah(request, id_constat):
    constat=get_object_or_404(models.Constat,id_constat=id_constat)
    accident=models.Accident.objects.get(constat=constat)
    serializer=serializers.accidentSerilizer(accident,many=False)
    return Response(serializer.data)

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username
        # ...

        return token


class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer


@api_view(['POST'])
def logout(request):
    try:
        refresh_token = request.data["refresh"]
        token = RefreshToken(refresh_token)
        token.blacklist()
        return Response({"message": "Successfully logged out."})
    except Exception as e:
        return Response({"error": str(e)})


@api_view(['POST'])
def create_user(request):
    if request.method == 'POST':
        serializer = UserCreateSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response("user crreated successufully")
        return Response(serializer.errors, status=400)


@api_view(['GET'])
def get_voiture(request, id_constat):
    constat = get_object_or_404(models.Constat, id_constat=id_constat)
    voiture = get_object_or_404(models.Voiture, constat=constat)
    serializer = serializers.voitureSerializer(voiture,many=False)
    return Response(serializer.data)


@api_view(['GET'])
def get_accident(request, id_constat):
    constat = get_object_or_404(models.Constat, id_constat=id_constat)
    accident = models.Voiture.objects.filter(constat=constat)
    serializer = serializers.accidentSerilizer(accident, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def create_degat(request, id_accident):
    data = request.data
    accident = models.Accident.objects.get(pk=id_accident)
    degat = models.Degat.objects.create(
        accident=accident,
        photo=data["photo"],
        description=data["description"],
        peinture=data["peinture"]
    )
    photo_path = os.path.join(settings.MEDIA_ROOT, degat.photo.name)
    print(f"Photo saved to: {photo_path}")
    serializer = serializers.DegatSerializer(degat, many=False)
    return Response("degat created successefully")

# Create your views here.
