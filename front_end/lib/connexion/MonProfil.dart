import 'package:e_constat/connexion/Accueil.dart';
import 'package:flutter/material.dart';

class MonProfil extends StatefulWidget {
  const MonProfil({super.key});

  @override
  State<MonProfil> createState() => _MonProfilState();
}

class _MonProfilState extends State<MonProfil> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00897b),
        title: const Text(
          "Mon Profile",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            const Text(
              "Veuillez compléter votre profil",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CostumTextFormField(label: "Nom"),
                    const SizedBox(
                      height: 20,
                    ),
                    CostumTextFormField(label: "Prénom"),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "ce champ est obligatoire";
                        }
                        if (!value.contains("@") || !value.contains(".")) {
                          return "email invalide";
                        }
                        return null; // Return null if validation passes
                      },
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff00897b),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          color: const Color(0xffF78D1E),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, "Accueil");
                          }
                        },
                        child: const Text(
                          "Enregister",
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
            ),
          ],
        ),
      ),
    );
  }
}

class CostumTextFormField extends StatelessWidget {
  final String label;
  CostumTextFormField({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "ce champ est obligatoire";
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff00897b),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
