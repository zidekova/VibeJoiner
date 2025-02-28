import 'package:vibejoiner/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(0, 0, 46, 22),
        body: SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 20),

          // logo
          Image.asset(
            'images/logo_vibejoiner.png',
            width: 200,
            alignment: Alignment.topCenter,
          ),

          const SizedBox(height: 40),

          // registration form
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                labelText: 'Používateľské meno'),
          ),

          const SizedBox(height: 30),

          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                labelText: 'E-mail'),
          ),

          const SizedBox(height: 30),

          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Heslo',
            ),
          ),

          const SizedBox(height: 30),

          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Potvrď heslo',
            ),
          ),

          const SizedBox(height: 20),

          // toggle switch
          ToggleSwitch(
            activeBgColor: const [Colors.deepPurple, Colors.deepPurple],
            initialLabelIndex: 0,
            labels: const ['Hudobník', 'Klient'],
            onToggle: (index) {},
            minWidth: 150,
          ),

          const SizedBox(height: 20),

          // register button
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('ZAREGISTRUJ SA'),
          ),

          // register text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Už máš účet?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'Prihlás sa',
                ),
              ),
            ],
          ),
        ]),
      )),
    ));
  }
}
