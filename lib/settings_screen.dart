import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _privacyEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Enable Privacy Settings'),
              value: _privacyEnabled,
              onChanged: (bool value) {
                setState(() {
                  _privacyEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Other Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Navigate to account settings
              },
            ),
            ListTile(
              title: Text('Language'),
              onTap: () {
                // Navigate to language settings
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Navigate to about screen
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Save settings
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Settings saved')),
                );
              },
              child: Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
