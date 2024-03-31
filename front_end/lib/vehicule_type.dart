import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:card_swiper/card_swiper.dart';

class type extends StatefulWidget {
  const type({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          "CHOOSE THE VEHICULE TYPE",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
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
                  print(index);
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
