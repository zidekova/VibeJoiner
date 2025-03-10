import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String imageUrl;

  const ProfilePic({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
