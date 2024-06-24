import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Your Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to registration screen
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
