import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        spacing: 20,
        children: [
          // profilescreen
          IconButton(
            onPressed: () {
              context.router.popAndPush(const ProfileRoute());
            },
            icon: const Icon(Icons.person),
            iconSize: 40,
          ),

          // chatlistscreen
          IconButton(
            onPressed: () {
              context.router.popAndPush(const ChatlistRoute());
            },
            icon: const Icon(Icons.chat),
            iconSize: 40,
          ),

          // homescreen
          IconButton(
            onPressed: () {
              context.router.popAndPush(const HomeRoute());
            },
            icon: const Icon(Icons.home),
            iconSize: 40,
          ),

          // searchscreen
          IconButton(
            onPressed: () {
              context.router.popAndPush(const SearchRoute());
            },
            icon: const Icon(Icons.search),
            iconSize: 40,
          ),

          // orderscreen
          IconButton(
            onPressed: () {
              context.router.popAndPush(const OrderRoute());
            },
            icon: const Icon(Icons.euro),
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
