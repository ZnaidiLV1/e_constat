import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("settings ",style: TextStyle(
      fontSize: 40
    ),)),
    );
  }
}
