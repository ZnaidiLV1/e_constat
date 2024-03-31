import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              "images/logo.png",
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              "E-constat",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffF78D1E),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "images/image4.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: const Color(0xffF78D1E),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: MaterialButton(
                onPressed: () {
                  scaffoldkey.currentState!
                      .showBottomSheet((context) => BottomSheetContent());
                },
                child: const Text(
                  "Remplir un constat",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ],
                  color: const Color(0xffF78D1E),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "connexion");
                },
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'choisir le mode de saisie',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: ((context) => Alert()));
                },
                child: const Text('2 conducteurs sur 2 smartphone'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "stepOne2");
                },
                child: const Text('2 conducteurs sur 1 smartphone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      title: const Text(
        "Conducteur B",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const IntlPhoneField(
              decoration: InputDecoration(
                labelText: "Numéro de téléphone",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: "TN",
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () {
                  //envoyer un sms au conducteur B
                  Navigator.pushNamed(context, "stepOne1");
                },
                child: const Text('Envoyer'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
