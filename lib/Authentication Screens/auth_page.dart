
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Main Screens/home_screen.dart';
import 'login_in.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomeScreen();
          }

          // user is NOT logged in
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}