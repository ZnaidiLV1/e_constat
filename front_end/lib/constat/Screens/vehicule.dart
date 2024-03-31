import 'package:e_constat/constat/Screens/typeVehicule.dart';
import 'package:flutter/material.dart';

class Vehicule extends StatefulWidget {
  final Color color;
  final String type;
  const Vehicule({super.key, required this.color, required this.type});

  @override
  State<Vehicule> createState() => _VehiculeState();
}

class _VehiculeState extends State<Vehicule> {
  bool ischecked = false;
  final GlobalKey<FormState> formKey = GlobalKey();
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
        child: ListView(
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
            Container(
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CostumTextFormField(
                        hint: "Societé d'assurance",
                        keybordtype: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CostumTextFormField(
                        hint: "Contrat N°",
                        keybordtype: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CostumTextFormField(
                        hint: "Agence",
                        keybordtype: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CostumTextFormField(
                        hint: "N° d'immatriculation",
                        keybordtype: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CostumTextFormField(
                        hint: "Marque",
                        keybordtype: TextInputType.text,
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )),
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
                  showDialog(
                      context: context,
                      builder: (context) =>
                          TypeVehicule(type: widget.type, color: widget.color));
                },
                child: const Text('Suivant'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class CostumTextFormField extends StatelessWidget {
  final String hint;
  final TextInputType keybordtype;
  CostumTextFormField(
      {super.key, required this.hint, required this.keybordtype});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keybordtype,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value == null) {
          return "ce champ est obligatoire";
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[500]),
      ),
    );
  }
}
