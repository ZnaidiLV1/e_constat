import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:front_end1/constat/Screens/Assure.dart';
import 'package:front_end1/serializer/voiture.dart';
import 'package:front_end1/serializer/accident.dart';
import 'package:front_end1/serializer/assure.dart';
import 'package:front_end1/serializer/constat.dart';
import 'package:front_end1/User_Login/Info_Constat.dart';

class mes_constats extends StatefulWidget {
  final http.Client client;
  final assure? assure_instance;
  final List<Constat> constat_list;

  mes_constats({
    Key? key,
    required this.client,
    required this.assure_instance,
    required this.constat_list,
  }) : super(key: key);

  @override
  State<mes_constats> createState() => _mes_constatsState();
}

class _mes_constatsState extends State<mes_constats> {
  Future<List<Accident>> _accidentsFuture = Future.value([]);

  @override
  void initState() {
    super.initState();
    _accidentsFuture = getAccidents();
  }

  Future<List<Accident>> getAccidents() async {
    List<Accident> accidents = [];
    for (var constat in widget.constat_list) {
      Uri getAccidentUri = Uri.parse(
          "http://10.0.2.2:8000/api/${constat.id_constat}/get_accident_ya_zah/");
      http.Response response = await widget.client.get(getAccidentUri);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        accidents.add(Accident.fromMap(responseData));
      } else {
        print('Failed to fetch accident data: ${response.statusCode}');
      }
    }
    return accidents;
  }

  assure? assure_autre;
  Voiture? mon_voiture;
  Voiture? voiture_autre;
  Constat? constat_autre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF161D32),
        title: Text(
          "Constats",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Accident>>(
        future: _accidentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Accident> accidents = snapshot.data ?? [];
            return ListView.builder(
              itemCount: accidents.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF161D32),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.info_sharp,
                      size: 40,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      final url = Uri.parse(
                          "http://10.0.2.2:8000/api/${widget.constat_list[index].numr_tlfn_autre_assure}/get_constat_u_want/");
                      final response = await http.get(url);

                      if (response.statusCode == 200) {
                        final responseData = json.decode(response.body);
                        constat_autre = Constat.fromMap(responseData);
                      } else {
                        throw Exception('Failed to load data');
                      }

                      final get_assure_autre = Uri.parse(
                          "http://10.0.2.2:8000/api/${widget.constat_list[index].numr_tlfn_autre_assure}/get_assure_wanted/");
                      final response2 = await http.get(get_assure_autre);
                      if (response2.statusCode == 200) {
                        final responseData2 = json.decode((response2).body);
                        assure_autre = assure.fromMap(responseData2[0]);
                      }
                      print(
                          "constat id ta3 lautre: ${constat_autre!.id_constat}");
                      final get_voiture_autre = Uri.parse(
                          "http://10.0.2.2:8000/api/${constat_autre!.id_constat}/get_voiture/");
                      final response3 = await http.get(get_voiture_autre);
                      if (response3.statusCode == 200) {
                        final responseData3 = json.decode((response3.body));
                        voiture_autre = Voiture.fromMap(responseData3);
                      } else {
                        throw Exception('Failed to load data');
                      }
                      final get_mon_voiture_ = Uri.parse(
                          "http://10.0.2.2:8000/api/${widget.constat_list[index].id_constat}/get_voiture/");
                      final response4 = await http.get(get_mon_voiture_);
                      if (response4.statusCode == 200) {
                        final responseData4 = json.decode(response4.body);
                        mon_voiture = Voiture.fromMap(responseData4);
                      } else {
                        throw Exception('Failed to load data');
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => info_constat(
                          accident_instance: accidents[index],
                          assure_instance: assure_autre,
                          constat_instance: widget.constat_list[index],
                          voiture_instance: voiture_autre,
                          mon_voiture: mon_voiture,
                        ),
                      ));
                    },
                    title: Row(
                      children: [
                        Icon(
                          Icons.place_sharp,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          " Lieu Accident : ${accidents[index].lieu_accident}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(children: [
                      Icon(
                        Icons.date_range_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        " Date Accident : ${accidents[index].date_accident}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
