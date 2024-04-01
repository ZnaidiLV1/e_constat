import 'package:e_constat/connexion/Accueil.dart';
import 'package:e_constat/connexion/Connexion.dart';
import 'package:e_constat/connexion/MonProfil.dart';
import 'package:e_constat/constat/OneUser/StepOne.dart';
import 'package:e_constat/constat/OneUser/StepTwo.dart';
import 'package:e_constat/constat/TwoUser/StepOneTwoUser.dart';

import 'package:e_constat/constat/TwoUser/StepTwo2User.dart';
import 'package:e_constat/firstpage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const FirstPage(),
        "connexion": (context) => const Connexion(),
        "profil": (context) => const MonProfil(),
        "Accueil": (context) => const Accueil(),
        "stepOne2": (context) => const StepOneTwoUser(),
        "stepTwo2": (context) => const StepTwo2User(),
        "stepOne1": (context) => const StepOne(),
        "stepTwo1": (context) => const StepTwo(),
      },
    );
  }
}
