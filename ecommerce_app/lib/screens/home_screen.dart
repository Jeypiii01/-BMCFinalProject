import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Call Firebase to sign out. AuthWrapper will handle navigation.
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: const Center(
        child: Text('You are logged in!'),
      ),
    );
  }
}