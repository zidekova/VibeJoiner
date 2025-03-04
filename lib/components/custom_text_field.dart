import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: labelText),
    );
  }
}
