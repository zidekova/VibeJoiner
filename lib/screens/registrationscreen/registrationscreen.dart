import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibejoiner/components/button_with_text.dart';
import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:vibejoiner/components/custom_text_field.dart';
import 'package:vibejoiner/components/solid_button.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
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

  var passwordIsVisible = false;
  var confirmPasswordIsVisible = false;

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
      // ignore: use_build_context_synchronously
      context.router.push(LoginRoute());
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
    return CenterScaffold(children: [
      const SizedBox(height: 20),
      // logo
      Image.asset(
        'images/logo_vibejoiner.png',
        width: 200,
        alignment: Alignment.topCenter,
      ),

      const SizedBox(height: 40),

      // registration form
      CustomTextField(
        controller: usernameController,
        obscureText: false,
        labelText: 'Používateľské meno',
      ),

      const SizedBox(height: 30),

      CustomTextField(
        controller: emailController,
        obscureText: false,
        labelText: 'E-mail',
      ),

      const SizedBox(height: 30),

      TextField(
        controller: passwordController,
        obscureText: !passwordIsVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Heslo',
          suffixIcon: IconButton(
            icon: Icon(
                passwordIsVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                passwordIsVisible = !passwordIsVisible;
              });
            },
          ),
        ),
      ),

      const SizedBox(height: 30),

      TextField(
        controller: confirmPasswordController,
        obscureText: !confirmPasswordIsVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Potvrď heslo',
          suffixIcon: IconButton(
            icon: Icon(confirmPasswordIsVisible
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {
              setState(() {
                confirmPasswordIsVisible = !confirmPasswordIsVisible;
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
      SolidButton(
        onPressed: register,
        text: 'ZAREGISTRUJ SA',
      ),

      // register text
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Už máš účet?'),
          ButtonWithText(
            onPressed: () {
              context.router.push(LoginRoute());
            },
            text: 'Prihlás sa',
          ),
        ],
      ),
    ]);
  }
}
