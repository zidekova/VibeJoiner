import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SolidButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
