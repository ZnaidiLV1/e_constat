
import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String nom_field = '';
  String prenom_field = "";
  String email_field = "";
  String num_tlfn_fielld = "";
  String num_permis_field = "";
  String password_field = "";
  http.Client client = http.Client();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00897b),
        title: const Text(
          "Mon Profile",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(children: [
        const Text(
          "Veuillez compléter votre profil",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        form_field(
            text: "nom",
            icon: Icons.abc,
            on_changed: (value) {
              nom_field = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            text: "prenom",
            icon: Icons.abc,
            on_changed: (value) {
              prenom_field = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            text: "numr tlfn",
            icon: Icons.abc,
            on_changed: (value) {
              num_tlfn_fielld = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            text: "num permis",
            icon: Icons.abc,
            on_changed: (value) {
              num_permis_field = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            text: "email",
            icon: Icons.abc,
            on_changed: (value) {
              email_field = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            text: "password",
            icon: Icons.abc,
            on_changed: (value) {
              password_field = value;
            },
            keyboard_type: TextInputType.text),
        MaterialButton(
          onPressed: () {
            client.post(Uri.parse("http://10.0.2.2:8000/api/create_user/"),
                body: {"username": email_field, "password": password_field});
            client.post(Uri.parse("http://10.0.2.2:8000/api/assure/"), 
            body: {
              'numr_tlfn': num_tlfn_fielld,
              'first_name': nom_field,
              'last_name': prenom_field,
              'num_permis': num_permis_field,
              'email_user': email_field,
              'numr_tlfn_autre_assure': "0"
            });
            print("verifi creata wala");
          },
          child: Text("create"),
        )
      ]),
    );
  }
}
