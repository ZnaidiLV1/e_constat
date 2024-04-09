
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00897b),
        title: const Text(
          "Connexion",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Image.asset(
              "images/logo.png",
              width: 150,
              height: 100,
            ),
            const Text(
              "Bienvenu à E-Constat",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Connectez-vous à votre compte",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: IntlPhoneField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: "Numéro de téléphone",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: "TN",
                validator: (value) {
                  if (value == null||value.number.isEmpty) {
                    return "ce champ est obligatoire";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value.completeNumber;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Color(0xffF78D1E),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "profil");
                  }
                },
                child: const Text(
                  "Se connecter",
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
    );
  }
}
