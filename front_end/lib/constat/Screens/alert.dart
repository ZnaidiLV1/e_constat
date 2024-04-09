import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      title: const Text(
        "Numero Conducteur",
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const IntlPhoneField(
              decoration: InputDecoration(
                labelText: "Numéro de téléphone",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: "TN",
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () {
                  //envoyer un sms au conducteur B
                  Navigator.pushNamed(context, "stepOne1");
                },
                child: const Text('Envoyer'),
              ),
            ]),
          ],
        ),
      ),
    );;
  }
}