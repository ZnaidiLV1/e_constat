import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StepThree extends StatefulWidget {
  final String type_vehicule;
  final http.Client client;
  final String consta_id;
  const StepThree(
      {required this.type_vehicule,
      required this.client,
      required this.consta_id});
  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  bool chocExiste = false;
  String? img;

  List<bool> selectedSpots = List.generate(11, (index) => false);

  void toggleSpot(int index) {
    setState(() {
      selectedSpots[index] = !selectedSpots[index];
    });
  }

  Offset? chocPosition;
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    if (widget.type_vehicule == "Voiture") {
      img = 'Voiture.png';
    }
    if (widget.type_vehicule == "Motocyclette") {
      img = "Motocyclette.jpg";
    }
    if (widget.type_vehicule == "Camion") {
      img = "Camion.jpg";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 106, 166),
        title: const Text(
          "Etape 3",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const LinearProgressIndicator(
            value: 0.5,
            color: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: const Text(
              "Les dégats apparents",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            height: screenheight / 10,
          ),
          Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Appuyez sur la zone de choc de votre véhicule",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: screenheight / 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          chocPosition = details.localPosition;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Image.asset(
                              'images/$img',
                            ),
                          ), // Replace with your car image
                          if (chocPosition != null && !chocExiste)
                            Positioned(
                              top: chocPosition!.dy -
                                  20, // Adjust the position as needed
                              left: chocPosition!.dx - 20,
                              child: const Icon(
                                Icons.warning_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                      value: chocExiste,
                      onChanged: (bool? value) {
                        setState(() {
                          chocExiste = value!;
                        });
                      }),
                  const Text(
                    "Pas de point de choc",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
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
                    if (!chocExiste) {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => Dommage(client: null,
                      //         ));
                    }
                  },
                  child: const Text("Suivant")),
            ],
          )
        ],
      ),
    );
  }
}
