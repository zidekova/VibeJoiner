import 'package:vibejoiner/components/blank_button.dart';
import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:vibejoiner/components/solid_button.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      children: [
        // logo
        Image.asset('images/logo_vibejoiner.png', width: 300),

        // slogan
        Text(
          'HUDBA NÁS SPÁJA',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 50),

        // button registracia
        SolidButton(
            text: 'ZAREGISTRUJ SA',
            onPressed: () {
              context.router.push(RegistrationRoute());
            }),

        const SizedBox(height: 25),

        // button login
        BlankButton(
            text: 'PRIHLÁS SA',
            onPressed: () {
              context.router.push(LoginRoute());
            })
      ],
    );
  }
}
