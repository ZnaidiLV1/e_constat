import 'package:flutter/material.dart';

class form_field extends StatefulWidget {
  String text;
  IconData icon;
  TextInputType keyboard_type; 
  ValueChanged<String> on_changed;
  form_field(
      {super.key,
      required this.text,
      required this.icon,
      required this.on_changed,
      required this.keyboard_type});
  @override
  State<form_field> createState() => _form_fieldState();
}

class _form_fieldState extends State<form_field> {
  bool temperatureSensitive = false;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.on_changed.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: _controller,
        validator: (value) {
          if (value!.isEmpty) return "field must not be empty";
        },
        keyboardType: widget.keyboard_type,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            size: 25,
            color: Color(0xFFD2A347),
          ),
          label: Text(widget.text,
              style: TextStyle(
                  color: Color(0xFFD2A347),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD2A347)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD2A347)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFD2A347)),
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
