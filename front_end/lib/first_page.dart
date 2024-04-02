import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                width: screenWidth * 0.7,
                child: Lottie.network(
                    "https://lottie.host/22aef387-eb77-4adc-a9c8-cb6369e181fd/z6zDlWGkMP.json"),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.05),
                height: screenheight * 0.1,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xFF193A59),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    scaffoldkey.currentState!
                        .showBottomSheet((context) => BottomSheetContent());
                  },
                  child: const Text(
                    "Remplir un Constat",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).animate().fade(delay: const Duration(seconds: 1)).slideY(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.02),
                height: screenheight * 0.1,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xFF193A59),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Creer un Compte",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).animate().fade(delay: const Duration(seconds: 2)).slideY(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: screenheight * 0.25,
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
