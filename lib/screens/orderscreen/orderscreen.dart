import 'package:flutter/material.dart';
import 'package:vibejoiner/components/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/center_scaffold.dart';

@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const CenterScaffold(
      children: [Text('Order Screen'), SizedBox(height: 50), BottomBar()],
    );
  }
}
