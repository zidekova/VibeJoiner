import 'package:vibejoiner/screens/loginscreen.dart';
import 'package:vibejoiner/screens/registrationscreen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<Offset> _logoOffsetAnimation;
  late Animation<double> _logoOpacityAnimation;

  late AnimationController _sloganController;
  late Animation<double> _sloganOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _logoOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    ));

    _logoOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    ));

    _sloganController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _sloganOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _sloganController,
      curve: Curves.easeIn,
    ));

    // Spustenie animacii
    _logoController.forward();
    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _sloganController.forward();
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              SlideTransition(
                position: _logoOffsetAnimation,
                child: FadeTransition(
                  opacity: _logoOpacityAnimation,
                  child: Image.asset(
                    'images/logo_vibejoiner.png',
                    width: 300,
                  ),
                ),
              ),

              // slogan
              FadeTransition(
                opacity: _sloganOpacityAnimation,
                child: const Text(
                  'HUDBA NÁS SPÁJA',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 50),

              // button registracia
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                },
                child: const Text(
                  'ZAREGISTRUJ SA',
                ),
              ),

              const SizedBox(height: 25),

              // button login
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text('PRIHLÁS SA'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
