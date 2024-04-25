import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:front_end1/User_Login/Accueil.dart';
import 'package:front_end1/User_Login/signup.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/serializer/assure.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  http.Client client = http.Client();
  String email_field = "";
  String password_field = "";
  assure assure_ins = assure(
      numr_tlfn: 0,
      first_name: "test",
      last_name: "last_name",
      email_user: "email_user",
      num_permis: 0);
  List assures = [];
  String refreshToken = "";
  String extract_username(String refresh) {
    Map<String, dynamic> infos = Jwt.parseJwt(refresh);
    return infos["username"];
  }

  get_assure() async {
    // final response = await client.get(Uri
    // // .parse("http://10.0.2.2:8000/api/{$extract_username()}/get_this_assure/")
    // .parse("http://127.0.0.1:8000/api/malek@gmail.com/get_this_assure/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002A29),
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: form_field(
              text: "Email",
              icon: Icons.email,
              on_changed: (value) {
                setState(() {
                  email_field = value;
                });
              },
              keyboard_type: TextInputType.emailAddress,
              obscure: false,
            ),
          ),
          form_field(
              obscure: true,
              text: "Password",
              icon: Icons.password_sharp,
              on_changed: (value) {
                setState(() {
                  password_field = value;
                });
              },
              keyboard_type: TextInputType.text),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(right: 90, left: 90),
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                http.Response response = await client
                    .post(Uri.parse("http://10.0.2.2:8000/api/token/"), body: {
                  "username": "test",
                  "password": "password"
                });
                if (response.statusCode == 200) {
                  Map<String, dynamic> data = json.decode(response.body);
                  String refreshToken = data['refresh'];
                  // Uri get_assure_uri = Uri.parse(
                  //     'http://10.0.2.2:8000/api/${extract_username(refreshToken)}/get_assure_email/');
                  Uri get_assure_uri = Uri.parse(
                      'http://10.0.2.2:8000/api/test/get_assure_email/');
                  List response2 =
                      json.decode((await client.get(get_assure_uri)).body);

                  assures = [];
                  response2.forEach((element) {
                    assures.add(assure.fromMap(element));
                  });
                  assure_ins = assures[0];
                  setState(() {});

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Accueil(
                            refreshtoken: refreshToken,
                            assure_instance: assure_ins,
                          )));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Authentication Error"),
                      content: Text(
                          "Incorrect email or password. Please try again."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text(
                'Login',
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
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => signup(),
                    ),
                  );
                },
                child: Text(
                  "clicker ici pour créer un compte",
                  style: TextStyle(
                      color: Color(0xFFD2A347),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ))
        ],
      ),
    );
  }
}
