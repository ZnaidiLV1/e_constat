// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:front_end1/constat/StepTwo.dart';
import 'package:front_end1/constat/Screens/Dommage.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:http/http.dart' as http;

import '../../serializer/assure.dart';

class Vehicule extends StatefulWidget {
  final String type_vehicule;
  final http.Client client;
  final String consta_id;
  Vehicule(
      {super.key,
      required this.client,
      required this.consta_id,
      required this.type_vehicule});

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
  String assurance_field = "";
  int? num_contat_field;
  int? agence_field;

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
                      text: "Immatriculation",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        immatriculation_field = value;
                      },
                      keyboard_type: TextInputType.number,
                    ),
                    form_field(
                      text: "Marque",
                      icon: Icons.car_repair,
                      on_changed: (value) {
                        marque_field = value;
                      },
                      keyboard_type: TextInputType.emailAddress,
                    ),
                    form_field(
                        text: "Entreprise d'Assurance",
                        icon: Icons.admin_panel_settings_outlined,
                        on_changed: (value) {
                          assurance_field = value;
                        },
                        keyboard_type: TextInputType.text),
                    form_field(
                        text: "Contrat N°",
                        icon: Icons.assignment_outlined,
                        on_changed: (value) {
                          num_contat_field = value as int?;
                        },
                        keyboard_type: TextInputType.number),
                    form_field(
                        text: "Agence",
                        icon: Icons.business_center_rounded,
                        on_changed: (value) {
                          agence_field = value as int?;
                        },
                        keyboard_type: TextInputType.number),
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
                        backgroundColor:
                            Color(0xFFD2A347), // Set text color (optional)
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Set border radius
                        ),
                      ),
                    ),
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
                            builder: (context) => StepTwo(
                                type_vehicule: widget.type_vehicule,
                                client: widget.client,
                                consta_id: widget.consta_id)));
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
