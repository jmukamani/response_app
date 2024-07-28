import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityFirstRespondersScreen extends StatelessWidget {
  final List<Map<String, String>> responders = [
    {
      'name': 'juliet Awino',
      'phone': '123-456-7890',
      'email': 'jiliet@example.com',
      'photo': 'assets/john_doe.png',
    },
    {
      'name': 'Islam Hemada',
      'phone': '098-765-4321',
      'email': 'islam@example.com',
      'photo': 'assets/jane_smith.png',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community First Responders'),
      ),
      body: ListView.builder(
        itemCount: responders.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(responders[index]['photo']!),
              ),
              title: Text(responders[index]['name']!),
              subtitle: Text(responders[index]['phone']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponderDetailScreen(responder: responders[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ResponderDetailScreen extends StatelessWidget {
  final Map<String, String> responder;

  ResponderDetailScreen({required this.responder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(responder['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(responder['photo']!),
            ),
            SizedBox(height: 20),
            Text(
              responder['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: ${responder['phone']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${responder['email']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall('tel:${responder['phone']}');
                  },
                  child: Text('Call'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _sendEmail(responder['email']!);
                  },
                  child: Text('Email'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    final Uri launchUri = Uri.parse(url);
    // ignore: deprecated_member_use
    if (await canLaunch(launchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    // ignore: deprecated_member_use
    if (await canLaunch(launchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(launchUri.toString());
    } else {
      throw 'Could not send email to $email';
    }
  }
}
