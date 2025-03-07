import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/center_scaffold.dart';

@RoutePage()
class ChatlistScreen extends StatefulWidget {
  const ChatlistScreen({super.key});

  @override
  State<ChatlistScreen> createState() => _ChatlistScreenState();
}

class _ChatlistScreenState extends State<ChatlistScreen> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chatlist Screen'),
      ),
      children: [],
    );
  }
}
