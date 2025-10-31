import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // We use a StreamBuilder to listen for auth changes
    return StreamBuilder<User?>(
      // This is the stream from Firebase
      stream: FirebaseAuth.instance.authStateChanges(),

      // The builder runs every time the auth state changes
      builder: (context, snapshot) {

        // If the snapshot is still loading, show a spinner
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If the snapshot has data, a user is logged in
        if (snapshot.hasData) {
          return const HomeScreen(); // Show the home screen
        }

        // If the snapshot has no data, no user is logged in
        return const LoginScreen(); // Show the login screen
      },
    );
  }
}