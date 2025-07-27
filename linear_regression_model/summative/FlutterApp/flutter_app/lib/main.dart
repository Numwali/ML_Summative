import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const StudentExamPredictorApp());
}

class StudentExamPredictorApp extends StatelessWidget {
  const StudentExamPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Score Predictor',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
