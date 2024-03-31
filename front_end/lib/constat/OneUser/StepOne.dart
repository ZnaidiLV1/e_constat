import 'package:e_constat/constat/Screens/CustomCard.dart';

import 'package:flutter/material.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF78D1E),
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
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00897b)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: const Text(
              "Identification du véhicule et du conducteur",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          CustomCard(
            titleCard: "A",
            color: const Color(0xff125d84),
            btn1: "Renseigner\n les informations du conducteur A",
            btn2: "Renseigner\n les informations du véhicule A",
            typeConducteur: "Conducteur A",
            typeVehicule: "Véhicule A",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF78D1E)), // Set background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set text color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ), // Set padding
                    elevation: MaterialStateProperty.all<double>(10),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("retour")),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF78D1E)), // Set background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set text color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ), // Set padding
                    elevation: MaterialStateProperty.all<double>(10),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "stepTwo1");
                  },
                  child: const Text("Suivant")),
            ],
          )
        ],
      ),
    );
  }
}
