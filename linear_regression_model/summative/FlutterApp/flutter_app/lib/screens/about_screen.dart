import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String aboutText = '''
This app predicts a student's exam score based on 5 key factors:

Study Hours Per Day:
More hours generally increase understanding and performance.

 Attendance Percentage:
High attendance ensures better participation and grasp of concepts.

 Sleep Hours:
Balanced sleep helps retain memory and reduces fatigue.

 Exercise Frequency:
Regular exercise improves focus and mental health.

 Mental Health Rating:
Better mental well-being leads to more effective learning.

The prediction is made using a machine learning model trained on real data.
  ''';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About the App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            aboutText,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
