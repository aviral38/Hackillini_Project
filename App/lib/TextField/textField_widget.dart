import 'package:flutter/material.dart';
class TextFieldWidget extends StatefulWidget {
  String hintText;
  final myController ;
  TextFieldWidget({required this.hintText, required this.myController});


  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.myController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
