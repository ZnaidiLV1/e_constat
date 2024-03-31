import 'package:flutter/material.dart';

class TypeVehicule extends StatefulWidget {
  final Color color;
  final String type;
  const TypeVehicule({super.key, required this.type, required this.color});

  @override
  State<TypeVehicule> createState() => _TypeVehiculeState();
}

class _TypeVehiculeState extends State<TypeVehicule> {
  bool car = false;
  bool moto = false;
  bool camion = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: widget.color,
          width: 4,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.directions_car,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.type,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("Choisissez le type de véhicule",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(
            height: 30,
          ),
          SelectType(context, "images/car.png", car, () {
            setState(() {
              car = !car;
              camion = false;
              moto = false;
            });
          }),
          const SizedBox(
            height: 30,
          ),
          SelectType(context, "images/camion.png", camion, () {
            setState(() {
              camion = !camion;
              car = false;
              moto = false;
            });
          }),
          const SizedBox(
            height: 30,
          ),
          SelectType(context, "images/moto.png", moto, () {
            setState(() {
              moto = !moto;
              car = false;
              camion = false;
            });
          }),
          const SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'infos');
              },
              child: const Text('Suivant'),
            ),
          ]),
        ],
      ),
    ));
  }

  InkWell SelectType(
      BuildContext context, String img, bool isImageClicked, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
        print("tap");
      },
      child: Container(
        color: isImageClicked ? Colors.grey : Colors.white,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 8,
        child: Image.asset(
          img,
        ),
      ),
    );
  }
}
