import 'package:flutter/material.dart';
import 'package:front_end1/serializer/accident.dart';
import 'package:front_end1/serializer/assure.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:front_end1/serializer/voiture.dart';

class info_constat extends StatefulWidget {
  Accident accident_instance;
  assure? assure_instance;
  Constat constat_instance;
  Voiture? voiture_instance;
  Voiture? mon_voiture;
  info_constat(
      {super.key,
      required this.accident_instance,
      required this.assure_instance,
      required this.constat_instance,
      required this.mon_voiture,
      required this.voiture_instance});

  @override
  State<info_constat> createState() => _info_constatState();
}

class _info_constatState extends State<info_constat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF161D32),
        title: Text(
          "Constats info",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.439,
            decoration: BoxDecoration(
                color: Color(0xFF161D32),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Information de l'autre assuré : ",
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
                            widget.assure_instance!.first_name,
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
                            widget.assure_instance!.last_name,
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
                          Text(
                            "  Email : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.assure_instance!.email_user,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
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
                            widget.assure_instance!.numr_tlfn.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Information sur la voiture :",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Immatriculation :    ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.voiture_instance!.immatriculation.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Marque : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.voiture_instance!.marque,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Type : ",
                            style: TextStyle(
                                color: Color(0xFF5B87FC),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.voiture_instance!.type,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, right: 20),
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF5B87FC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              )),
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Contacter l'assuré"),
                                  content: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(height: 16),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF193A59),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Annuler',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF193A59),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Appeler',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Contacter",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.439,
            decoration: BoxDecoration(
                color: Color(0xFF161D32),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Information sur l'accident : ",
                    style: TextStyle(
                        color: Color(0xFF5B87FC),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 25,
                          color: Color(0xFF5B87FC),
                        ),
                        Text(
                          "  Lieu Accident : ",
                          style: TextStyle(
                              color: Color(0xFF5B87FC),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.accident_instance.lieu_accident,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 25,
                          color: Color(0xFF5B87FC),
                        ),
                        Text(
                          "  Date Accident : ",
                          style: TextStyle(
                              color: Color(0xFF5B87FC),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.accident_instance.date_accident,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Information sur mon voiture : ",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Immatriculation :    ",
                      style: TextStyle(
                          color: Color(0xFF5B87FC),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.mon_voiture!.immatriculation.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Marque : ",
                      style: TextStyle(
                          color: Color(0xFF5B87FC),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.mon_voiture!.marque,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Type : ",
                      style: TextStyle(
                          color: Color(0xFF5B87FC),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.mon_voiture!.type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, right: 20),
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF5B87FC),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Dégats",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
