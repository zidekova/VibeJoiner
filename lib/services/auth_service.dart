import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  googleSignIn(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication auth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    // ignore: use_build_context_synchronously
    context.router.pop();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await GoogleSignIn().signOut();
      print("GoogleSignIn disconnected");
      await FirebaseAuth.instance.signOut();
      print("FirebaseAuth signed out");
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nepodarilo sa odhlásiť")),
      );
    }
    // ignore: use_build_context_synchronously
    context.router.pop();
  }
}
