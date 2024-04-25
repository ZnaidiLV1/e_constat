
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end1/constat/Screens/assurance.dart';
import 'package:front_end1/constat/Screens/assurance2.dart';
import 'package:http/http.dart' as http;

class StepThree extends StatefulWidget {
  http.Client client;
  bool nb_assure_desire;
   StepThree({super.key,required this.client,required this.nb_assure_desire});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  bool chocExiste = false;
  List<bool> selectedSpots = List.generate(11, (index) => false);

  void toggleSpot(int index) {
    setState(() {
      selectedSpots[index] = !selectedSpots[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF78D1E),
        title: const Text(
          "Etape 3",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const LinearProgressIndicator(
            value: 0.3,
            color: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00897b)),
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
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Véhicule",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "aaaa",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.directions_car_filled_sharp,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Appuyez sur la zone de choc de votre véhicule",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const PointChoc(),
              const SizedBox(
                height: 10,
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
                      if(widget.nb_assure_desire)
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => assurance2()));
                  }
                  else{
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => assurance()));
                  }
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

class PointChoc extends StatefulWidget {
  const PointChoc({super.key});

  @override
  State<PointChoc> createState() => _PointChocState();
}

class _PointChocState extends State<PointChoc> {
  Offset? chocPosition;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            chocPosition = details.localPosition;
            //  print(chocPosition);
          });
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Image.asset(
                'images/car_dessus.png',
              ),
            ), // Replace with your car image
            if (chocPosition != null)
              Positioned(
                top: chocPosition!.dy - 20, // Adjust the position as needed
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
    );
  }
}
