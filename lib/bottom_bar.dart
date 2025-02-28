import 'package:flutter/material.dart';
import 'package:vibejoiner/screens/chatlistscreen.dart';
import 'package:vibejoiner/screens/homescreen.dart';
import 'package:vibejoiner/screens/orderscreen.dart';
import 'package:vibejoiner/screens/profilescreen.dart';
import 'package:vibejoiner/screens/searchscreen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: [
        // profilescreen
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.person),
          iconSize: 40,
        ),

        // chatlistscreen
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatlistScreen()),
            );
          },
          icon: const Icon(Icons.chat),
          iconSize: 40,
        ),

        // homescreen
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: const Icon(Icons.home),
          iconSize: 40,
        ),

        // searchscreen
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
          icon: const Icon(Icons.search),
          iconSize: 40,
        ),

        // orderscreen
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrderScreen()),
            );
          },
          icon: const Icon(Icons.euro),
          iconSize: 40,
        ),
      ],
    );
  }
}
