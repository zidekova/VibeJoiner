import 'package:flutter/material.dart';

class CenterScaffold extends StatelessWidget {
  final List<Widget> children;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const CenterScaffold({
    super.key,
    required this.children,
    this.appBar,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
