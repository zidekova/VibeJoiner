import 'package:flutter/material.dart';

class CenterScaffold extends StatelessWidget {
  final List<Widget> children;
  //final AppBar appBar;

  const CenterScaffold({
    super.key,
    required this.children,
    /*required this.appBar*/
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: appBar,
        body: SingleChildScrollView(
      child: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children))),
    ));
  }
}
