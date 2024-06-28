import 'package:flutter/material.dart';

void main() {
  runApp(FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid Training',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FirstAidHomePage(),
    );
  }
}

class FirstAidHomePage extends StatelessWidget {
  final List<FirstAidModule> modules = [
    FirstAidModule(
      title: 'CPR',
      description: 'Cardiopulmonary Resuscitation procedure.',
      image: 'assets/cpr.png',
    ),
    FirstAidModule(
      title: 'Choking',
      description: 'Procedure for assisting someone who is choking.',
      image: 'assets/choking.png',
    ),
    FirstAidModule(
      title: 'Burns',
      description: 'Steps to treat minor and major burns.',
      image: 'assets/burns.png',
    ),
    FirstAidModule(
      title: 'Fractures',
      description: 'How to handle and immobilize fractures.',
      image: 'assets/fractures.png',
    ),
    // Add more modules here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Training'),
      ),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(modules[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstAidDetailPage(module: modules[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FirstAidDetailPage extends StatelessWidget {
  final FirstAidModule module;

  FirstAidDetailPage({required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(module.image),
            SizedBox(height: 20),
            Text(
              module.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(module.description),
          ],
        ),
      ),
    );
  }
}

class FirstAidModule {
  final String title;
  final String description;
  final String image;

  FirstAidModule({required this.title, required this.description, required this.image});
}