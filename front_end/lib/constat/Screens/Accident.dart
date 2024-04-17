
import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/vehicule_type.dart';
import 'package:http/http.dart' as http;

class Accident extends StatefulWidget {
  http.Client client;
  String constat_id;
  Accident({super.key, required this.constat_id, required this.client});

  @override
  State<Accident> createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  http.Client client = http.Client();
  final GlobalKey<FormState> formKey = GlobalKey();
  String nom_field = "";
  String prenom_field = "";
  String email_field = "";
  String num_tlfn_field = "";
  String num_tlfn_autre_assure_field = "";
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
                    "Conducteur",
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
                      keyboard_type: TextInputType.emailAddress,
                    ),
                    form_field(
                      text: "Numero Telephone",
                      icon: Icons.format_list_numbered_outlined,
                      on_changed: (value) {
                        num_tlfn_field = value;
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
                        foregroundColor: Colors.black, backgroundColor: Color(0xFFD2A347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Uri create_consucteurURI = Uri.parse(
                        //     "http://10.0.2.2:8000/api/${widget.ass.numr_tlfn}/conducteur/");
                        // client.post(create_consucteurURI, body: {
                        //   'assure': widget.ass.numr_tlfn.toString(),
                        //   'numr_tlfn': num_tlfn_field,
                        //   'first_name': nom_field,
                        //   'last_name': prenom_field,
                        //   'num_permis': email_field,
                        // });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => type(
                                  client: client,
                                  constat_id: widget.constat_id,
                                )));
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
