import 'package:vibejoiner/screens/homescreen.dart';
import 'package:vibejoiner/screens/registrationscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 70),

          // logo
          Image.asset(
            'images/logo_vibejoiner.png',
            width: 200,
            alignment: Alignment.topCenter,
          ),

          const SizedBox(height: 100),

          // login form
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                labelText: 'Používateľské meno alebo e-mail'),
          ),

          const SizedBox(height: 30),

          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Heslo',
            ),
          ),

          const SizedBox(height: 30),

          // login button
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text('PRIHLÁS SA'),
          ),

          // register text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ešte nemáš účet?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                },
                child: const Text(
                  'Zaregistruj sa',
                ),
              ),
            ],
          ),
        ]),
      )),
    ));
  }
}
