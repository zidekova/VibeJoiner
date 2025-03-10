import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibejoiner/screens/main/main_screen.dart';
import 'package:vibejoiner/screens/registration/registration_screen.dart';
import 'package:vibejoiner/screens/start/start_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/riverpod/auth_provider.dart';
import 'package:vibejoiner/services/auth_service.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: authState.when(
          data: (user) {
            if (user != null) {
              if (isUserNew) {
                return const RegistrationScreen();
              } else {
                return const MainScreen();
              }
            } else {
              return const StartScreen();
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $error'),
                ),
              );
            });
            return const StartScreen();
          }),
    );
  }
}
