import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/form_field.dart';
import 'package:front_end1/vehicule_type.dart';
import 'package:http/http.dart' as http;

class accident extends StatefulWidget {
  http.Client client;
  String constat_id;
  bool nb_assure_desire;
  accident(
      {super.key,
      required this.constat_id,
      required this.client,
      required this.nb_assure_desire});

  @override
  State<accident> createState() => _accidentState();
}

class _accidentState extends State<accident> {
  http.Client client = http.Client();
  final GlobalKey<FormState> formKey = GlobalKey();
  String lieu_field = "";
  String date_field="";
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
                    Icons.car_crash_sharp,
                    size: 60,
                    color: Color(0xFFD2A347),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Accident",
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
                      text: "Lieu Accident",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        lieu_field = value;
                      },
                      keyboard_type: TextInputType.text,
                    ),
                    form_field(
                      obscure: false,
                      text: "Date Accident",
                      icon: Icons.person_2_sharp,
                      on_changed: (value) {
                        date_field = value;
                      },
                      keyboard_type: TextInputType.datetime,
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
                        // Uri create_consucteurURI = Uri.parse(
                        //     "http://10.0.2.2:8000/api/${widget.constat_id}/create_accident/");
                        // client.post(create_consucteurURI, body: {
                        //   'constat': widget.constat_id.toString(),
                        //   'lieu_accident': lieu_field,
                        //   'date_accident': date_field
                        // });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => type(
                                  client: client,
                                  constat_id: widget.constat_id, nb_assure_desire:widget.nb_assure_desire ,
                                )));
                        print("verifi creaata wala??");
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
