import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:vibejoiner/components/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/services/auth_service.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CenterScaffold(
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

          // button google
          SignInButton(
            text: 'REGISTRÁCIA ALEBO PRIHLÁSENIE',
            onPressed: () async {
              await AuthService().googleSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
