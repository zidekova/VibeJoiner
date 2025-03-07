import 'package:vibejoiner/components/center_scaffold.dart';
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
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registrácia'),
      ),
      children: [],
      // toggle switch
      /*ToggleSwitch(
        activeBgColor: const [Colors.deepPurple, Colors.deepPurple],
        initialLabelIndex: 0,
        labels: const ['Hudobník', 'Klient'],
        onToggle: (index) {},
        minWidth: 150,
      ),*/
    );
  }
}
