import 'package:front_end1/constat/Screens/CustomCard.dart';

import 'package:flutter/material.dart';

class StepOneTwoUser extends StatefulWidget {
  const StepOneTwoUser({super.key});

  @override
  State<StepOneTwoUser> createState() => _StepOneTwoUserState();
}

class _StepOneTwoUserState extends State<StepOneTwoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 106, 166),
        title: const Text(
          "Etape 1",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LinearProgressIndicator(
            value: 0.1,
            color: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: const Text(
              "Identification du l'Assuré",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomCard(
            titleCard: "A",
            color: const Color(0xff125d84),
            btn1: "Renseigner\n les informations du conducteur A",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomCard(
            titleCard: "B",
            color: const Color(0xfff6b042),
            btn1: "Renseigner\n les informations du conducteur B",
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
