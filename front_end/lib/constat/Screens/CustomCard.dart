import 'package:e_constat/constat/Screens/Assure.dart';
import 'package:e_constat/constat/Screens/Conducteur.dart';
import 'package:e_constat/constat/Screens/vehicule.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String titleCard;
  final String btn1;
  final String btn2;
  final Color color;
  final String typeConducteur;
  final String typeVehicule;
  CustomCard(
      {required this.titleCard,
      required this.color,
      required this.btn1,
      required this.btn2,
      required this.typeConducteur,
      required this.typeVehicule,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: color,
          width: 4,
        ),
      ),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Véhicule",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: color),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      titleCard,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: color),
                    ),
                  ],
                ),
                Icon(
                  Icons.directions_car,
                  color: color,
                  size: 40,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 5, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color(0xff39b54a),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Etes-vous l'assuré ?"),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (constext) => Assure(
                                                  color: color,
                                                  type: titleCard)));
                                    },
                                    child: const Text('Non'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Conducteur(
                                                  color: color,
                                                  type: titleCard)));
                                    },
                                    child: const Text('Oui'),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      btn1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 5, right: 7),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color(0xff39b54a),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Vehicule(
                            color: color,
                            type: typeVehicule,
                          ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      btn2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
