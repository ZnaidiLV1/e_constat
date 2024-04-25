import 'package:flutter/material.dart';
import 'package:front_end1/serializer/assure.dart';

class info_ex extends StatefulWidget {
  String assure_instance_info;
  String name;
  info_ex({super.key, required this.assure_instance_info, required this.name});

  @override
  State<info_ex> createState() => _info_exState();
}

class _info_exState extends State<info_ex> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.assure_instance_info,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          child: Divider(
            color: Colors.black,
            height: 15,
            thickness: 3,
          ),
        )
      ],
    );
  }
}
