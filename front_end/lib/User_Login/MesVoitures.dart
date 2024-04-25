import 'package:flutter/material.dart';

class mes_voitures extends StatefulWidget {
  const mes_voitures({super.key});

  @override
  State<mes_voitures> createState() => _mes_voituresState();
}

class _mes_voituresState extends State<mes_voitures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mes voitures"),
      ),
    );
  }
}