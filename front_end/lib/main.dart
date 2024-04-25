import 'package:flutter/material.dart';

// Assuming first_page.dart contains your desired home page content
import 'package:front_end1/first_page.dart';

// Import other screens based on your navigation needs


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

      routes: {
        "/": (context) => const first_page(),
      },
    );
  }
}
