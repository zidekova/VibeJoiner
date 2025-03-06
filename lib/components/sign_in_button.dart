import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SignInButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
      ),
      onPressed: onPressed,
      label: Text(text),
      icon: Image.asset('images/google_icon.png', width: 20),
    );
  }
}
