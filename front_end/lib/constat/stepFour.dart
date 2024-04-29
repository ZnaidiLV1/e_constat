import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:front_end1/constat/StepFive.dart';
import 'package:screenshot/screenshot.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class StepFour extends StatefulWidget {
  final http.Client client;
  final String consta_id;

  const StepFour({
    Key? key,
    required this.client,
    required this.consta_id,
  }) : super(key: key);

  @override
  State<StepFour> createState() => _StepFourState();
}

class _StepFourState extends State<StepFour> {
  final GlobalKey<SignatureState> signatureKey = GlobalKey();
  late ScreenshotController screenshotController;
  bool ImageSaved = false;

  void saveScreenshot() async {
    // Capture the screenshot
    screenshotController.capture().then((Uint8List? image) async {
      final name = "croquis ${widget.consta_id}";
      await ImageGallerySaver.saveImage(image!, name: name);
    });
  }

  bool showListAssure = false;
  bool showListVehicule = false;
  List<String> type_assure = ["assure A", "assure B"];
  List<String> type_vehicule = ['Voiture', 'Motocyclette', 'Camion'];
  String? selectedAssure;
  Map<String, List<String>> selectedVehicules = {};

  Map<String, Offset> _positions = {};
  Map<String, double> _rotationAngles = {};

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
    type_assure.forEach((assure) {
      selectedVehicules[assure] = [];
      _positions[assure] = Offset.zero;
      _rotationAngles[assure] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 106, 166),
        title: const Text(
          "Etape 4",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          const LinearProgressIndicator(
            value: 0.7,
            color: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Croquis de l'accident",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Screenshot(
            controller: screenshotController,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Signature(
                    key: signatureKey,
                  ),
                  for (var assure in selectedVehicules.entries)
                    for (int i = 0; i < assure.value.length; i++)
                      if (selectedAssure != null)
                        Positioned(
                          left: _positions[assure.key]!.dx,
                          top: _positions[assure.key]!.dy,
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              setState(
                                () {
                                  _positions[assure.key] =
                                      (_positions[assure.key] ?? Offset.zero) +
                                          details.delta;
                                },
                              );
                            },
                            child: Transform.rotate(
                              angle: _rotationAngles[assure.key] ??
                                  0, // Use the rotation angle for each insurer
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rotationAngles[assure.key] =
                                        (_rotationAngles[assure.key] ?? 0) +
                                            pi / 8;
                                  });
                                },
                                child:
                                    getImageWidget(assure.value[i], assure.key),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          if (showListAssure)
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: type_assure.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 5),
                        margin: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAssure = type_assure[index];
                              showListVehicule = !showListVehicule;
                            });
                          },
                          child: Text(
                            type_assure[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (showListVehicule &&
                          selectedAssure == type_assure[index])
                        Expanded(
                          child: Container(
                            height: 40,
                            child: ListView.builder(
                              itemCount: type_vehicule.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, vehiculeIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    if (selectedAssure != null) {
                                      // Check if selectedAssure is not null
                                      setState(() {
                                        selectVehicle(selectedAssure!,
                                            type_vehicule[vehiculeIndex]);
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    child: Text(
                                      type_vehicule[vehiculeIndex],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.directions_car_filled_rounded),
              onPressed: () {
                setState(() {
                  showListAssure = !showListAssure;
                  showListVehicule = false;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                final sign = signatureKey.currentState;
                sign?.clear();
                setState(() {
                  selectedVehicules.forEach((key, value) {
                    selectedVehicules[key] = [];
                    _positions[key] = Offset(0, 0);
                    _rotationAngles[key] = 0;
                  });
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.save_alt),
              onPressed: () {
                if (!selectedVehicules.values
                        .every((element) => element.isEmpty) &&
                    signatureKey.currentState!.hasPoints) {
                  saveScreenshot();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Image Saved"),
                    duration: Duration(milliseconds: 100),
                  ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StepFive(client: widget.client,consta_id: widget.consta_id,)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageWidget(String vehicule, String assure) {
    String imagePath = _getImagePath(vehicule, assure);
    if (imagePath.isNotEmpty) {
      return Image.asset(
        imagePath,
        width: 70,
        height: 70,
      );
    } else {
      return const Text(
        'Image not found',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      );
    }
  }

  String _getImagePath(String vehicule, String assure) {
    if (assure == "assure A") {
      if (vehicule == "Voiture") {
        return "images/carA.png";
      }
      if (vehicule == "Motocyclette") {
        return "images/motoA.png";
      }
      if (vehicule == "Camion") {
        return "images/camionA.png";
      }
    } else if (assure == "assure B") {
      if (vehicule == "Voiture") return "images/carB.png";
      if (vehicule == "Motocyclette") return "images/motoB.png";
      if (vehicule == "Camion") return "images/camionB.png";
    }
    return '';
  }

  void selectVehicle(String assure, String vehicle) {
    setState(() {
      selectedVehicules[assure]!
          .clear(); // Clear previous vehicles for this assure
      selectedVehicules[assure]!.add(vehicle); // Add the new vehicle
    });
  }
}
