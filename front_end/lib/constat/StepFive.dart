import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class StepFive extends StatefulWidget {
  final http.Client client;
  final String consta_id;
  const StepFive({super.key, required this.client, required this.consta_id});

  @override
  State<StepFive> createState() => _StepFiveState();
}

class _StepFiveState extends State<StepFive> {
  double Height = 0.0;
  Icon iconSave = const Icon(null);
  Icon icondelete = const Icon(null);
  final GlobalKey<SignatureState> signatureKey = GlobalKey();
  final ScreenshotController screenshotController = ScreenshotController();
  void saveScreenshot() async {
    // Capture the screenshot
    screenshotController.capture().then((Uint8List? image) async {
      final name = "signature ${widget.client}";
      await ImageGallerySaver.saveImage(image!, name: name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 106, 166),
          title: const Text(
            "Etape 5",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(children: [
          const LinearProgressIndicator(
            value: 0.9,
            color: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "la signature",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: const Color(0xFF193A59),
                width: 4,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Height = MediaQuery.of(context).size.height / 3;
                  iconSave = const Icon(Icons.save_alt_sharp);
                  icondelete = const Icon(Icons.delete);
                });
              },
              child: Card(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Assuré",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF193A59)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'A',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF193A59)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.person,
                          color: Color(0xFF193A59),
                          size: 40,
                        )
                      ],
                    ),
                    Screenshot(
                      controller: screenshotController,
                      child: Container(
                        color: Colors.white,
                        height: Height,
                        child: Signature(
                          key: signatureKey,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                signatureKey.currentState!.clear();
                              });
                            },
                            icon: icondelete),
                        IconButton(
                            onPressed: () {
                              if (signatureKey.currentState!.hasPoints) {
                                saveScreenshot();
                                Height = 0.0;
                                
                              }
                            },
                            icon: iconSave),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
