import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:front_end1/first_page.dart';

class assurance extends StatefulWidget {
  const assurance({Key? key}) : super(key: key);

  @override
  State<assurance> createState() => _assuranceState();
}

class _assuranceState extends State<assurance> {
  String _selectedItem = 'Choisir votre assurance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002A29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25),
              alignment: Alignment.center,
              color: Color(0xFFD2A347),
              child: DropdownButton<String>(
                icon: Icon(
                  Icons.assured_workload,
                  color: Color(0xFF002A29),
                ),
                iconDisabledColor: Color(0xFFD2A347),
                iconEnabledColor: Color(0xFFD2A347),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                alignment: Alignment.center,
                dropdownColor: Color(0xFFD2A347),
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                items: <String>[
                  'Choisir votre assurance',
                  'A M I ASSURANCES',
                  'ASTREE',
                  'STAR',
                  'G A T ASSURANCES'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xFFD2A347),
              ),
              child: MaterialButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: Text(
                        'le constat est envoyé avec succés',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    btnOkOnPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => first_page(),
                        ),
                      );
                    },
                  )..show();
                },
                child: Text("SEND"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
