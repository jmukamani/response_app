import 'package:flutter/material.dart';
import 'emergency_services_screen.dart';
import 'feedback_screen.dart';
import 'first_aid_training_screen.dart'; 
import 'profile_screen.dart';
import 'location_sharing_screen.dart';
import 'communication_screen.dart';
import 'community_first_responders_screen.dart';
import 'offline_emergency_mode_screen.dart';
import 'settings_screen.dart';
import 'help_and_support_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    EmergencyServicesScreen(),
    Text('Profile'),
    Text('Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            // App Logo
            Image.asset('assets/logo.png', height: 100, width: 100),
            SizedBox(height: 20),
            // Welcome Message
            Text(
              'Welcome, User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Navigation Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  _buildNavigationButton(context, 'Emergency Services', Icons.local_hospital, EmergencyServicesScreen()),
                  _buildNavigationButton(context, 'Profile', Icons.person, ProfileScreen()),
                  _buildNavigationButton(context, 'Location Sharing', Icons.location_on, LocationSharingScreen()),
                  _buildNavigationButton(context, 'First Aid Training', Icons.school, FirstAidTrainingScreen()), 
                  _buildNavigationButton(context, 'Communication', Icons.chat, CommunicationScreen()),
                  _buildNavigationButton(context, 'Community First Responders', Icons.people, CommunityFirstRespondersScreen()),
                  _buildNavigationButton(context, 'Offline Emergency Mode', Icons.offline_bolt, OfflineEmergencyModeScreen()),
                  _buildNavigationButton(context, 'Settings', Icons.settings, SettingsScreen()),
                  _buildNavigationButton(context, 'Help and Support', Icons.help, HelpAndSupportScreen()),
                  _buildNavigationButton(context, 'Feedback', Icons.feedback, FeedbackScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
