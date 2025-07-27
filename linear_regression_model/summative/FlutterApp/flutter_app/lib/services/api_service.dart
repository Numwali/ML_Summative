import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://ml-summative-1dlp.onrender.com';

  static Future<double?> predictExamScore({
    required double studyHours,
    required double attendance,
    required double sleepHours,
    required int exerciseFrequency,
    required double mentalHealth,
  }) async {
    final url = Uri.parse('$baseUrl/predict_exam_score');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'study_hours_per_day': studyHours,
        'attendance_percentage': attendance,
        'sleep_hours': sleepHours,
        'exercise_frequency': exerciseFrequency,
        'mental_health_rating': mentalHealth,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['predicted_exam_score'];
    } else {
      // ignore: avoid_print
      print("Prediction failed: ${response.body}");
      return null;
    }
  }
}
