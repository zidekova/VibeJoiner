import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibejoiner/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistrationScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var password_is_visible = false;
  var confirm_password_is_visible = false;

  void register() async {
    if (passwordController.text != confirmPasswordController.text) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Chyba'),
                content: const Text('Heslá sa nezhodujú'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      debugPrint('...................User registered.................');
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Chyba'),
                content: Text(e.code),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
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
          TextField(
            controller: usernameController,
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Používateľské meno'),
          ),

          const SizedBox(height: 30),

          TextField(
            controller: emailController,
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'E-mail'),
          ),

          const SizedBox(height: 30),

          TextField(
            controller: passwordController,
            obscureText: !password_is_visible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Heslo',
              suffixIcon: IconButton(
                icon: Icon(password_is_visible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    password_is_visible = !password_is_visible;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 30),

          TextField(
            controller: confirmPasswordController,
            obscureText: !confirm_password_is_visible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Potvrď heslo',
              suffixIcon: IconButton(
                icon: Icon(confirm_password_is_visible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    confirm_password_is_visible = !confirm_password_is_visible;
                  });
                },
              ),
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
            onPressed: register,
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
    )));
  }
}
