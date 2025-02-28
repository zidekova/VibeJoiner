import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibejoiner/screens/homescreen.dart';
import 'package:vibejoiner/screens/registrationscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var password_is_visible = false;

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 70),

            // logo
            Image.asset(
              'images/logo_vibejoiner.png',
              width: 200,
              alignment: Alignment.topCenter,
            ),

            const SizedBox(height: 100),

            // login form
            TextField(
              controller: emailController,
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Používateľské meno alebo e-mail'),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: passwordController,
              obscureText: !password_is_visible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
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

            // login button
            ElevatedButton(
              onPressed: login,
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
      ),
    ));
  }
}
