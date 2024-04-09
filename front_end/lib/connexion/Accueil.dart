import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end1/first_page.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class Accueil extends StatefulWidget {
  String refreshtoken;
  Accueil({super.key, required this.refreshtoken});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  http.Client client = http.Client();
  String extract_username() {
    Map<String, dynamic> username = Jwt.parseJwt(widget.refreshtoken);
    return username["username"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "images/logo.png",
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              "E-constat",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffF78D1E),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xff00897b),
                padding: const EdgeInsets.all(40),
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CostumInkWell(
                        title: "Mes Constats",
                        icon: Icons.home_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CostumInkWell(
                          title: "Mon Profile", icon: Icons.person),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CostumInkWell(
                        title: "Mes Véhicules",
                        icon: Icons.directions_car,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CostumInkWell(
                        title: "Déconnexion",
                        icon: Icons.logout,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              client.post(Uri.parse("http://10.0.2.2:8000/api/logout/"),
                  body: {"refresh": widget.refreshtoken});
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context)=>first_page()));
            },
            icon: Icon(Icons.logout)),
        backgroundColor: Color(0xff00897b),
        title: Text(
          "Acceuil",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(children: [
        Text(extract_username())
      ]),
    );
  }
}

class CostumInkWell extends StatelessWidget {
  final IconData icon;
  final String title;
  CostumInkWell({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Container tapped!');
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
