import 'package:flutter/material.dart';

class SimpleConducteur extends StatefulWidget {
  final Color color;
  final String type;
  const SimpleConducteur({super.key, required this.color, required this.type});

  @override
  State<SimpleConducteur> createState() => _SimpleConducteurState();
}

class _SimpleConducteurState extends State<SimpleConducteur> {
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
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Conducteur",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.type,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
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
                        hint: "Nom",
                        keybordtype: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CostumTextFormField(
                        hint: "Prénom",
                        keybordtype: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CostumTextFormField(
                        hint: "Permis de conduit N°",
                        keybordtype: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CostumTextFormField(
                        hint: "Date de délivrance du permis ",
                        keybordtype: TextInputType.datetime,
                      ),
                      const SizedBox(
                        height: 50,
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
                onPressed: () {},
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
      validator: (value) {
        if (value == null || value.isEmpty) {
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
