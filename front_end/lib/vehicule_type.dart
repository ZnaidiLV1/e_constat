import 'package:flutter/material.dart';
import 'package:front_end1/constat/Screens/vehicule.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:card_swiper/card_swiper.dart';

class type extends StatefulWidget {
  http.Client client;
  String constat_id;
  type({super.key, required this.client, required this.constat_id});

  @override
  State<type> createState() => _typeState();
}

class _typeState extends State<type> {
  List<Widget> icon_list = [
    Lottie.network(
        'https://lottie.host/cddc7037-0b85-4bdb-92c4-9cf190223e8e/mjoRlMWveZ.json'),
    Lottie.network(
        'https://lottie.host/c16d0bd3-72a6-4ac4-9768-6f0d44bbfcd7/ussh9wN29N.json'),
    Lottie.network(
        'https://lottie.host/0df3a31d-9325-4639-a449-950110f415cb/xQHiK7mprx.json')
  ];
  List<String> type_list = ["Voiture", "Motocyclette", "Camion"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002A29),
      appBar: AppBar(
        backgroundColor: Color(0xFFD2A347),
        title: const Text(
          "Choisissez le type de véhicule",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002A29)),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFD2A347),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 400,
          width: 300,
          child: Swiper(
            itemHeight: 225,
            itemWidth: 0,
            loop: true,
            duration: 1200,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Vehicule(
                            client: widget.client,
                            type_vehicule: type_list[index],
                            consta_id: widget.constat_id,
                          )));
                },
                child: Container(
                  child: icon_list[index],
                ),
              );
            },
            itemCount: icon_list.length,
          ),
        ),
      ),
    );
  }
}
