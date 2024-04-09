import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end1/connexion/Accueil.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  http.Client client = http.Client();
  String email_field = "";
  String password_field = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          form_field(
              text: "Email",
              icon: Icons.email,
              on_changed: (value) {
                setState(() {
                  email_field = value;
                });
              },
              keyboard_type: TextInputType.emailAddress),
          form_field(
              text: "Password",
              icon: Icons.password_sharp,
              on_changed: (value) {
                setState(() {
                  password_field = value;
                });
              },
              keyboard_type: TextInputType.text),
          MaterialButton(
            onPressed: () async {
              http.Response response = await client.post(
                  Uri.parse("http://10.0.2.2:8000/api/token/"),
                  body: {"username": email_field, "password": password_field});
              if (response.statusCode == 200) {
                Map<String, dynamic> data = json.decode(response.body);
                String refreshToken = data['refresh'];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Accueil(
                          refreshtoken: refreshToken,
                        )));
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Authentication Error"),
                    content:
                        Text("Incorrect email or password. Please try again."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text("login"),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("sign up"),
          )
        ],
      ),
    );
  }
}
