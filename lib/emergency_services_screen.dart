import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class EmergencyServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _buildEmergencyServiceCard(context, 'Police', Icons.local_police, 'tel:911'),
            _buildEmergencyServiceCard(context, 'Hospital', Icons.local_hospital, 'tel:911'),
            _buildEmergencyServiceCard(context, 'Fire', Icons.local_fire_department, 'tel:911'),
      
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyServiceCard(BuildContext context, String serviceName, IconData icon, String phoneNumber) {
    return GestureDetector(
      onTap: () {
        _showEmergencyDialog(context, serviceName, phoneNumber);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(serviceName, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context, String serviceName, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(serviceName),
          content: Text('Would you like to call $serviceName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Call the service
                final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  // Handle the error when the URL can't be launched
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch $serviceName')),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text('Call'),
            ),
          ],
        );
      },
    );
  }
}
