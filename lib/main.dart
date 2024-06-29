import 'package:flutter/material.dart';
import 'home_screen.dart'

void main() {
  runApp(EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  get home_screen => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: home_screen.dart(),  // Use the HomeScreen widget
    );
  }
}

