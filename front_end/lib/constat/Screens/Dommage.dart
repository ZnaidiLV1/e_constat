import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end1/constat/Screens/CustomCard.dart';
import 'package:front_end1/constat/Screens/form_field.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Dommage extends StatefulWidget {
  http.Client client;
  Dommage({super.key, required this.client});

  @override
  State<Dommage> createState() => _DommageState();
}

class _DommageState extends State<Dommage> {
  File? _image;
  String description_field = '';
  final picker = ImagePicker();
  TextEditingController _descriptionController = TextEditingController();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002A29),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0xFFD2A347),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Dégats",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002A29)),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.car_crash_sharp,
                    size: 30,
                    color: Color(0xFF002A29),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: _image == null
                ? Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        color: Color(0xFFD2A347),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFD2A347))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add_a_photo_sharp,
                            size: 40,
                          ),
                          onPressed: () {
                            showOptions();
                          },
                          color: Color(0xFF002A29),
                        ),
                        const Text(
                          "Ajouter une photo",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF002A29)),
                        )
                      ],
                    ))
                : Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    child: Stack(children: [
                      Image.file(_image!),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            padding: const EdgeInsets.all(10),
                            color: Color(0xFFD2A347),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(width: 5),
                                  Text("Supprimer"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ])),
          ),
          form_field(
              text: "Description des degats",
              icon: Icons.description,
              on_changed: (value) {
                setState(() {
                  description_field = value;
                });
              },
              keyboard_type: TextInputType.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text(
                  'Annuler',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD2A347),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text(
                  'Suivant',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD2A347),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
