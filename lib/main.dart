import 'package:vibejoiner/screens/startscreen.dart';
import 'package:flutter/material.dart';
import 'package:vibejoiner/themes.dart';

void main() {
  runApp(const VibeJoiner());
}

class VibeJoiner extends StatelessWidget {
  const VibeJoiner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ???
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const StartScreen(),
    );
  }
}
