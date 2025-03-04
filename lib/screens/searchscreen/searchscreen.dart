import 'package:flutter/material.dart';
import 'package:vibejoiner/components/bottom_bar.dart';
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
    return const CenterScaffold(
      children: [Text('Search Screen'), SizedBox(height: 50), BottomBar()],
    );
  }
}
