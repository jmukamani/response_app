import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to login screen
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
