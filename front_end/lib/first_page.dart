import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.1),
                width: screenWidth * 0.7,
                child: Lottie.network(
                    "https://lottie.host/22aef387-eb77-4adc-a9c8-cb6369e181fd/z6zDlWGkMP.json"),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.1),
                height: screenWidth * 0.14,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFF193A59),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "CREATE CONSTAT",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).animate().fade(delay: Duration(seconds: 1)).slideY(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.02),
                height: screenWidth * 0.14,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFF193A59),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).animate().fade(delay: Duration(seconds: 2)).slideY(),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
