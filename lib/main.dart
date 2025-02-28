import 'package:firebase_core/firebase_core.dart';
import 'package:vibejoiner/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:vibejoiner/firebase_options.dart';
import 'package:vibejoiner/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VibeJoiner());
}

class VibeJoiner extends StatelessWidget {
  const VibeJoiner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const AuthScreen(),
    );
  }
}
