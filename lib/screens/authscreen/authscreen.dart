import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibejoiner/screens/homescreen/homescreen.dart';
import 'package:vibejoiner/screens/startscreen/startscreen.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const StartScreen();
          }
        },
      ),
    );
  }
}
