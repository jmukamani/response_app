import 'package:flutter/material.dart';

class FirstAidTrainingScreen extends StatelessWidget {
  final List<Map<String, String>> modules = [
    {
      'title': 'CPR Instructions',
      'content': '1. Place the heel of your hand on the center of the chest.\n'
          '2. Place the other hand on top and interlock your fingers.\n'
          '3. Press down hard and fast, allowing the chest to rise completely between compressions.\n'
          '4. Perform 30 compressions and 2 rescue breaths, repeat.',
    },
    {
      'title': 'Treating Burns',
      'content': '1. Cool the burn with cool running water for at least 10 minutes.\n'
          '2. Cover the burn with a sterile dressing or clean cloth.\n'
          '3. Do not apply ointments or break blisters.\n'
          '4. Seek medical attention for severe burns.',
    },
    {
      'title': 'Choking Relief',
      'content': '1. Stand behind the person and wrap your arms around their waist.\n'
          '2. Make a fist with one hand and place it above the navel.\n'
          '3. Grasp the fist with your other hand and perform quick, upward thrusts.\n'
          '4. Repeat until the object is expelled or the person becomes unconscious.',
    },
    {
      'title': 'Bleeding Control',
      'content': '1. Apply direct pressure to the wound with a clean cloth.\n'
          '2. Elevate the injured area above the heart if possible.\n'
          '3. Maintain pressure until bleeding stops.\n'
          '4. Seek medical attention if bleeding is severe or does not stop.',
    },
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
              subtitle: Text(modules[index]['content']!),
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
