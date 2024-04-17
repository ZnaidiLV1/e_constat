import 'package:flutter/material.dart';

// Assuming first_page.dart contains your desired home page content
import 'package:front_end1/first_page.dart';

// Import other screens based on your navigation needs
import 'package:front_end1/connexion/Accueil.dart';
import 'package:front_end1/connexion/Connexion.dart';
import 'package:front_end1/connexion/signup.dart';
import 'package:front_end1/constat/OneUser/StepOne.dart';

import 'package:front_end1/constat/TwoUser/StepOneTwoUser.dart';

void main() {
  runApp(MyApp());
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
      routes: {
        "/": (context) => const first_page(),
        "connexion": (context) => const Connexion(),
        "profil": (context) => const signup(),
        "stepOne2": (context) => const StepOneTwoUser(),
        "stepOne1": (context) => const StepOne(),
      },
    );
  }
}
