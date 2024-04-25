// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/Dommage.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:http/http.dart' as http;

import '../../serializer/assure.dart';

class Vehicule extends StatefulWidget {
  String type_vehicule;
  bool nb_assure_desire;
  http.Client client;
  String consta_id;
  Vehicule(
      {super.key,
      required this.client,
      required this.consta_id,
      required this.type_vehicule,
      required this.nb_assure_desire});

  @override
  State<Vehicule> createState() => _VehiculeState();
}

class _VehiculeState extends State<Vehicule> {
  http.Client client = http.Client();
  final GlobalKey<FormState> formKey = GlobalKey();
  String carte_grise_field = "";
  String immatriculation_field = "";
  String marque_field = "";
  String type_field = "";
  @override
  void initState() {
    super.initState();
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
                    "Véhicule",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD2A347)),
                  ),
                  const SizedBox(
                    width: 10,
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
                      obscure: false,
                      text: "Carte Grise",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        carte_grise_field = value;
                      },
                      keyboard_type: TextInputType.text,
                    ),
                    form_field(
                      obscure: false,
                      text: "Immatriculation",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        immatriculation_field = value;
                      },
                      keyboard_type: TextInputType.number,
                    ),
                    form_field(
                      obscure: false,
                      text: "Marque",
                      icon: Icons.car_repair,
                      on_changed: (value) {
                        marque_field = value;
                      },
                      keyboard_type: TextInputType.emailAddress,
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
                    //   ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: const Text(
                    //       'Annuler',
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0xFFD2A347), // Set background color
                    //       onPrimary: Colors.black, // Set text color (optional)
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(30), // Set border radius
                    //       ),
                    //     ),
                    //   ),
                    ElevatedButton(
                      onPressed: () {
                        // Uri create_consucteurURI = Uri.parse(
                        //     "http://10.0.2.2:8000/api/${widget.consta_id}/create_voiture/");
                        // client.post(create_consucteurURI, body: {
                        //   'constat': widget.consta_id,
                        //   'carte_grise': carte_grise_field,
                        //   'immatriculation': immatriculation_field,
                        //   'marque': marque_field,
                        //   'type': widget.type_vehicule,
                        // });
                        // if (widget.reponse) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Dommage(
                                  client: client, nb_assure_desire: widget.nb_assure_desire,
                                )));
                        // } else {
                        //   Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (context) => const Conducteur(
                        //               color: Color(0xFF002A29),
                        //               type: "Vehicule")));
                        // }
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
                        primary: Color(0xFFD2A347),
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
