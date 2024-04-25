import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end1/User_Login/Accueil.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/serializer/assure.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';

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
  String refresh_token = "";
  String email_assure = "";
  http.Client client = http.Client();
  List assures = [];
  String extract_username() {
    Map<String, dynamic> infos = Jwt.parseJwt(refresh_token);
    return infos["username"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002A29),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          alignment: Alignment.center,
          child: Text(
            "Complete your information",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD2A347)),
          ),
        ),
        form_field(
          obscure: false,
          text: "Nom",
          icon: Icons.person_2_sharp,
          on_changed: (value) {
            nom_field = value;
          },
          keyboard_type: TextInputType.text,
        ),
        form_field(
          obscure: false,
          text: "Prenom",
          icon: Icons.person_2_sharp,
          on_changed: (value) {
            prenom_field = value;
          },
          keyboard_type: TextInputType.text,
        ),
        form_field(
          obscure: false,
          text: "Numero Permis",
          icon: Icons.car_repair,
          on_changed: (value) {
            num_permis_field = value;
          },
          keyboard_type: TextInputType.number,
        ),
        form_field(
          obscure: false,
          text: "Numero Telephone",
          icon: Icons.format_list_numbered_outlined,
          on_changed: (value) {
            num_tlfn_fielld = value;
          },
          keyboard_type: TextInputType.number,
        ),
        form_field(
            obscure: false,
            text: "email",
            icon: Icons.email,
            on_changed: (value) {
              email_field = value;
            },
            keyboard_type: TextInputType.text),
        form_field(
            obscure: true,
            text: "password",
            icon: Icons.password,
            on_changed: (value) {
              password_field = value;
            },
            keyboard_type: TextInputType.text),
        Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.only(right: 90, left: 90),
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              http.Response response = await client.post(
                  Uri.parse("http://10.0.2.2:8000/api/create_user/"),
                  body: {"username": email_field, "password": password_field});
              http.Response response2 = await client.post(
                  Uri.parse("http://10.0.2.2:8000/api/token/"),
                  body: {"username": email_field, "password": password_field});
              Map<String, dynamic> decoded = json.decode(response2.body);
              refresh_token = decoded["refresh"];
              client.post(Uri.parse("http://10.0.2.2:8000/api/assure/"), body: {
                'numr_tlfn': num_tlfn_fielld,
                'first_name': nom_field,
                'last_name': prenom_field,
                'num_permis': num_permis_field,
                'email_user': email_field,
              });
              Uri get_assure_uri = Uri.parse(
                  'http://10.0.2.2:8000/api/${extract_username()}/get_this_assure/');
              List response_assure =
                  json.decode((await client.get(get_assure_uri)).body);
              response_assure.forEach((element) {
                assures.add(assure.fromMap(element));
              });
              assure assure_ins = assures[0];
              setState(() {});
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Accueil(
                    refreshtoken: refresh_token,
                    assure_instance: assure_ins,
                  ),
                ),
              );
            },
            child: Text(
              'Create',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002A29),
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color(0xFFD2A347),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(80, 30)),
          ),
        ),
      ]),
    );
  }
}
