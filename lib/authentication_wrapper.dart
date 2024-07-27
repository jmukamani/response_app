import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: duplicate_import
import 'package:response_app/home_screen.dart';import 'home_screen.dart';  // Replace with your HomeScreen import
import 'login_screen.dart';  // Replace with your SignInScreen import
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}
