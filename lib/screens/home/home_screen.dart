import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:vibejoiner/services/auth_service.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => AuthService().signOut(context),
          ),
        ],
      ),
      children: [],
    );
  }
}
