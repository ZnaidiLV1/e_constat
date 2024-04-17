import 'dart:convert';
import 'package:front_end1/constat/Screens/Conducteur.dart';
import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:front_end1/vehicule_type.dart';
import 'package:http/http.dart' as http;

class Assure extends StatefulWidget {
  final Color color;
  final String type;
  bool reponse;
  Assure(
      {super.key,
      required this.color,
      required this.type,
      required this.reponse});

  @override
  State<Assure> createState() => _AssureState();
}

class _AssureState extends State<Assure> {
  http.Client client = http.Client();
  final GlobalKey<FormState> formKey = GlobalKey();
  String nom_field = "";
  String prenom_field = "";
  String email_field = "";
  String num_tlfn_field = "";
  String num_tlfn_autre_assure_field = "";
  Future get_constat(id_assure) async {
    Constat response = json.decode((await client.get(
            Uri.parse("http://10.0.2.2:8000/api/${id_assure}/get_constat/")))
        .body);
    return response.id_constat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        decoration: BoxDecoration(
          color: const Color(0xFF002A29),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFFD2A347),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "L'assuré",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD2A347)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.type,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    form_field(
                      text: "Nom",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        nom_field = value;
                      },
                      keyboard_type: TextInputType.text,
                    ),
                    form_field(
                      text: "Prenom",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        prenom_field = value;
                      },
                      keyboard_type: TextInputType.text,
                    ),
                    form_field(
                      text: "Numero Permis",
                      icon: Icons.car_repair,
                      on_changed: (value) {
                        email_field = value;
                      },
                      keyboard_type: TextInputType.number,
                    ),
                    form_field(
                      text: "Numero Telephone",
                      icon: Icons.format_list_numbered_outlined,
                      on_changed: (value) {
                        num_tlfn_field = value;
                      },
                      keyboard_type: TextInputType.number,
                    ),
                    form_field(
                      text: "Num Telephone de l'autre Assure",
                      icon: Icons.format_list_numbered_rtl,
                      on_changed: (value) {
                        num_tlfn_autre_assure_field = value;
                      },
                      keyboard_type: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color(0xFFD2A347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Uri create_assureURI =
                        //     Uri.parse("http://10.0.2.2:8000/api/assure/");
                        // client.post(create_assureURI, body: {
                        //   'numr_tlfn': num_tlfn_field,
                        //   'first_name': nom_field,
                        //   'last_name': prenom_field,
                        //   'num_permis': email_field,
                        //   'email_user': "test",
                        //   'numr_tlfn_autre_assure': num_tlfn_autre_assure_field
                        // });
                        // Uri create_constatURI =
                        //     Uri.parse("http://10.0.2.2:8000/api/${num_tlfn_field}/create_constat/");
                        // client.post(create_constatURI,
                        //     body: {'assure': num_tlfn_field});
                        if (widget.reponse) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => type(
                                        client: client,
                                        constat_id: "1",
                                      )));
                        } else {
                          // assure ass = assure(
                          //   numr_tlfn: int.parse(num_tlfn_field),
                          //   first_name: nom_field,
                          //   last_name: prenom_field,
                          //   email_user: "",
                          //   num_permis: int.parse(email_field),
                          //   numr_tlfn_autre_assure:
                          //       int.parse(num_tlfn_autre_assure_field),
                          // );
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => Conducteur(
                                        client: client,
                                        constat_id: '1',
                                      )));
                        }
                      },
                      child: Text(
                        'Suivant',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD2A347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
