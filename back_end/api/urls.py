from django.urls import path,include
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from . import views
urlpatterns=[
    path('',views.get_routes),
    path('assure/',views.create_assure),
    path('<int:id_assure>/conducteur/',views.create_conductor),
    path('get/',views.get_assure),
    path('<str:email_assure>/get_assure_email/',views.get_assure_x),
    path('<int:id_assure>/get_conducteurs/',views.get_conducteur),
    path('<int:numr_tlfn>/get_assure_wanted/',views.get_assure_wanted),
    path('<int:id_assure>/create_constat/',views.create_constat),
    path('<int:id_con>/get_constat_u_want/',views.get_constat_u_want),
    path('<int:id_assure>/get_constats/',views.get_constats),
    path('<int:id_constat>/create_voiture/',views.create_voiture),
    path('<int:id_constat>/get_voiture/',views.get_voiture),
    path('<int:id_constat>/create_accident/',views.create_accident),
    path('<int:id_constat>/get_accident_ya_zah/',views.get_accident_ya_zah),
    path('token/', views.MyTokenObtainPairView.as_view()),
    path('token/refresh/', TokenRefreshView.as_view()),
    path('logout/', views.logout),
    path('create_user/',views.create_user),
    path('<int:id_accident>/create_degat/',views.create_degat),
    path('<str:email_assure>/get_this_assure/',views.get_assure_x)
]