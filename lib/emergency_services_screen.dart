import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmergencyServicesScreen(),
    );
  }
}

class EmergencyServicesScreen extends StatelessWidget {
  final String phoneNumber = "+254741377211"; // Common emergency number for demonstration

  Future<void> _makePhoneCall(String url) async {
    final Uri launchUri = Uri.parse(url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            ServiceIcon(
              icon: Icons.local_police,
              label: "Police",
              onTap: () => _makePhoneCall('tel:$phoneNumber'),
            ),
            ServiceIcon(
              icon: Icons.local_hospital,
              label: "Hospital",
              onTap: () => _makePhoneCall('tel:$phoneNumber'),
            ),
            ServiceIcon(
              icon: Icons.local_fire_department,
              label: "Fire",
              onTap: () => _makePhoneCall('tel:$phoneNumber'),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceIcon({Key? key, required this.icon, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 50),
          Text(label),
        ],
      ),
    );
  }
}
