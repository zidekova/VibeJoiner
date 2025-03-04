import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var passwordIsVisible = false;

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      context.router.maybePop(HomeRoute());
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
        obscureText: !passwordIsVisible,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
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
              context.router.push(RegistrationRoute());
            },
            child: const Text(
              'Zaregistruj sa',
            ),
          ),
        ],
      ),
    ]);
  }
}
