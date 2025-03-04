import 'package:flutter/material.dart';

class BlankButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BlankButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
