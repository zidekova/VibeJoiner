import 'package:flutter/material.dart';
import 'package:vibejoiner/components/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/center_scaffold.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile Screen'),
        ),
        bottomNavigationBar: BottomBar(),
        children: []);
  }
}
