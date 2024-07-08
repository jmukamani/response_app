import 'package:flutter/material.dart';
import 'home_screen.dart'; 
void main() {
  runApp(EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),  // Use the HomeScreen widget
    );
  }
}
