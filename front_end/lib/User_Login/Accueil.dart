import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end1/User_Login/Home_Page.dart';
import 'package:front_end1/User_Login/MesConducteurs.dart';
import 'package:front_end1/User_Login/MesVoitures.dart';
import 'package:front_end1/User_Login/Mes_Constats.dart';
import 'package:front_end1/User_Login/Profile.dart';
import 'package:front_end1/User_Login/drawer_option.dart';
import 'package:front_end1/User_Login/settings.dart';
import 'package:front_end1/serializer/accident.dart';
import 'package:front_end1/serializer/assure.dart';
import 'package:front_end1/serializer/conducteur.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:http/http.dart' as http;

class Accueil extends StatefulWidget {
  String refreshtoken;
  assure? assure_instance;
  Accueil(
      {super.key, required this.refreshtoken, required this.assure_instance});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  http.Client client = http.Client();
  late assure assure_ins;
  Future<assure>? _assureFuture;

  @override
  void initState() {
    super.initState();
  }

  // }
  int selected_index = 0;
  List<Constat> constats = [];
  List<Accident> accidents = [];

  void home_void() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Accueil(
            refreshtoken: widget.refreshtoken,
            assure_instance: widget.assure_instance)));
  }

  void constat_void() async {
    constats = [];
    Uri get_assures = Uri.parse(
        "http://10.0.2.2:8000/api/${widget.assure_instance!.numr_tlfn.toString()}/get_constats/");

    List responses = json.decode((await client.get(get_assures)).body);
    responses.forEach((element) {
      constats.add(Constat.fromMap(element));
    });
    // constats.forEach((element)async {
    //   Uri get_accident = Uri.parse(
    //               "http://10.0.2.2:8000/api/${element.id_constat}/get_accident_ya_zah/");

    //   http.Response response = await client.get(get_accident);
    //   Map<String, dynamic> responseData = json.decode(response.body);
    //   accidents.add(Accident.fromMap(responseData));

    // });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => mes_constats(
              assure_instance: widget.assure_instance,
              constat_list: constats,
              client: client,
            )));
  }

  void voiture_void() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => mes_voitures()));
  }

  void settings_void() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => settings()));
  }

  List<Conducteur> conducteurs = [];
  void driver_void() async {
    final get_conducteur_list = Uri.parse(
        "http://10.0.2.2:8000/api/${widget.assure_instance!.numr_tlfn}/get_conducteurs/");
    final response = await http.get(get_conducteur_list);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      responseData.forEach((element) {
        conducteurs.add(Conducteur.fromMap(element));
      });
    } else {
      print('Failed to fetch conducteurs: ${response.statusCode}');
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => mes_conducteurs(
              conducteur_list: conducteurs,
            )));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widget_list = [
      home_page(
        assure_instance: widget.assure_instance,
      ),
      profile_page(
        assure_instance: widget.assure_instance,
      ),
      settings()
    ];
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFF161D32),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ListTile(
                leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.jpg")),
                subtitle: Text("Assuré",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                title: Text("malek1414s1s@gmail.com",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
            ),
            Container(
              child: Divider(
                color: Colors.white24,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Text("Options",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white38)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            drawer_op(
                icon: Icons.home, name: "Home", void_to_happen: home_void),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            drawer_op(
                icon: Icons.car_crash,
                name: "My Claims",
                void_to_happen: constat_void),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            drawer_op(
                icon: Icons.car_crash,
                name: "My Drivers",
                void_to_happen: driver_void),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            drawer_op(
                icon: Icons.settings,
                name: "Settings",
                void_to_happen: settings_void),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            drawer_op(
                icon: Icons.app_settings_alt_outlined,
                name: "About",
                void_to_happen: () {}),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Divider(
                color: Colors.white24,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              selected_index = val;
            });
          },
          currentIndex: selected_index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
      appBar: AppBar(
        centerTitle: true,
        title: Container(width: 90, child: Image.asset('images/logo.png')),
        // leading: IconButton(
        //     onPressed: () {
        //       client.post(Uri.parse("http://10.0.2.2:8000/api/logout/"),
        //           body: {"refresh": widget.refreshtoken});
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => first_page()));
        //     },
        //     icon: Icon(Icons.logout)),
      ),
      body: widget_list[selected_index],
      // body: home_page(assure_instance: assure_ins,),
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
