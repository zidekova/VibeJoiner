import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/center_scaffold.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search Screen'),
      ),
      children: [],
    );
  }
}
