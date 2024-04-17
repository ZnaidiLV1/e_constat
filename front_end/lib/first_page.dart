import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_end1/connexion/login.dart';
import 'package:front_end1/connexion/signup.dart';
import 'package:front_end1/constat/OneUser/StepOne.dart';
import 'package:lottie/lottie.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Color.fromARGB(255, 18, 124, 123),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                "images/logo.png",
                width: 180,
                height: 120,
                fit: BoxFit.cover,
              ),
              const Text(
                "E-constat",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF78D1E),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                child: Lottie.network(
                    "https://lottie.host/22aef387-eb77-4adc-a9c8-cb6369e181fd/z6zDlWGkMP.json"),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.05),
                height: screenheight * 0.1,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xFFD2A347),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    scaffoldkey.currentState!
                        .showBottomSheet((context) => BottomSheetContent());
                  },
                  child: const Text(
                    "Remplir un Constat",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002A29)),
                  ).animate().fade(delay: const Duration(seconds: 1)).slideY(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenheight * 0.02),
                height: screenheight * 0.1,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xFFD2A347),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => login()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002A29)),
                  ).animate().fade(delay: const Duration(seconds: 2)).slideY(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: screenheight * 0.25,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'CHOISIR LE MODE DE SAISIE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF002A29)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: Text(
                  '2 CONDUCTEUR SUR 2 TELEPHONES',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context, builder: ((context) => StepOne()));
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "stepOne2");
                },
                child: Text(
                  '2 CONDUCTEURS SUR 1 TELEPHONE',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
