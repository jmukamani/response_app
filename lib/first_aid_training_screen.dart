import 'package:flutter/material.dart';

class FirstAidTrainingScreen extends StatelessWidget {
  final List<Map<String, String>> modules = [
    {
      'title': 'CPR',
      'description': 'Learn how to perform CPR on adults, children, and infants.',
      'content': 'Step-by-step CPR instructions...'
    },
    {
      'title': 'Choking',
      'description': 'What to do if someone is choking.',
      'content': 'Step-by-step choking relief instructions...'
    },
    {
      'title': 'Burns',
      'description': 'How to treat minor and severe burns.',
      'content': 'Step-by-step burn treatment instructions...'
    },
    {
      'title': 'Bleeding',
      'description': 'How to control bleeding in an emergency.',
      'content': 'Step-by-step bleeding control instructions...'
    },
    // Add more modules as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Training'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(modules[index]['title']!),
              subtitle: Text(modules[index]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModuleDetailScreen(module: modules[index]),
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

class ModuleDetailScreen extends StatelessWidget {
  final Map<String, String> module;

  ModuleDetailScreen({required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              module['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              module['content']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
