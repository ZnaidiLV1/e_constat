import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/Conducteur.dart';
import 'package:front_end1/serializer/conducteur.dart';

class mes_conducteurs extends StatefulWidget {
  List<Conducteur>? conducteur_list;
  mes_conducteurs({super.key, required this.conducteur_list});

  @override
  State<mes_conducteurs> createState() => _mes_conducteursState();
}

class _mes_conducteursState extends State<mes_conducteurs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF161D32),
        title: Text(
          "Conducteurs",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: widget.conducteur_list == null || widget.conducteur_list!.isEmpty
          ? Center(
              child: Text(
                'Aucune conducteurs est disponible',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
            margin: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Color(0xFF161D32),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Information du Conducteur : ",
                    style: TextStyle(
                        color: Color(0xFF5B87FC),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 3,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Nom : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.conducteur_list![index].first_name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Prenom : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.conducteur_list![index].last_name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            size: 20,
                            color: Color(0xFF5B87FC),
                          ),
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.format_list_numbered_sharp,
                            size: 20,
                            color: Color(0xFF5B87FC),
                          ),
                          Text(
                            "  Numero Telephone : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.conducteur_list![index].numr_tlfn.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      
                      
                    ],
                  ),
                ),
              ],
            ),
          );
              },
            ),
    );
  }
}
