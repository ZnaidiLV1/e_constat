import 'package:flutter/material.dart';

class drawer_op extends StatefulWidget {
  String name;
  IconData icon;
  VoidCallback void_to_happen;
  drawer_op(
      {super.key,
      required this.icon,
      required this.name,
      required this.void_to_happen});

  @override
  State<drawer_op> createState() => _drawer_opState();
}

class _drawer_opState extends State<drawer_op> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        color: Color(0xFF5B87FC),
        onPressed: () {
          widget.void_to_happen();
          print("test");
        },
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: Colors.white,
            size: 20,
          ),
          title: Text(widget.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
