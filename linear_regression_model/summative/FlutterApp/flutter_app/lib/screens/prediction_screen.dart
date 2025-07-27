import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _studyHoursController = TextEditingController();
  final _attendanceController = TextEditingController();
  final _sleepHoursController = TextEditingController();
  final _exerciseFrequencyController = TextEditingController();
  final _mentalHealthController = TextEditingController();

  String? _predictionResult;
  bool _isLoading = false;

  void _makePrediction() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _predictionResult = null;
      });

      final result = await ApiService.predictExamScore(
        studyHours: double.parse(_studyHoursController.text),
        attendance: double.parse(_attendanceController.text),
        sleepHours: double.parse(_sleepHoursController.text),
        exerciseFrequency: int.parse(_exerciseFrequencyController.text),
        mentalHealth: double.parse(_mentalHealthController.text),
      );

      setState(() {
        _isLoading = false;
        _predictionResult = result != null
            ? "Predicted Exam Score: ${result.toStringAsFixed(2)}"
            : "Prediction failed. Please try again.";
      });
    }
  }

  @override
  void dispose() {
    _studyHoursController.dispose();
    _attendanceController.dispose();
    _sleepHoursController.dispose();
    _exerciseFrequencyController.dispose();
    _mentalHealthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Make a Prediction")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildNumberField(
                  _studyHoursController, "Study Hours/Day (0-12)", 0, 12),
              _buildNumberField(
                  _attendanceController, "Attendance % (0-100)", 0, 100),
              _buildNumberField(
                  _sleepHoursController, "Sleep Hours (0-24)", 0, 24),
              _buildNumberField(_exerciseFrequencyController,
                  "Exercise Frequency (0-7)", 0, 7,
                  isInteger: true),
              _buildNumberField(_mentalHealthController,
                  "Mental Health Rating (0-10)", 0, 10),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _makePrediction,
                child: Text(_isLoading ? "Predicting..." : "Predict"),
              ),
              const SizedBox(height: 24),
              if (_predictionResult != null)
                Text(
                  _predictionResult!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberField(
      TextEditingController controller, String label, double min, double max,
      {bool isInteger = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: !isInteger),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Required';
          final parsed = double.tryParse(value);
          if (parsed == null) return 'Must be a number';
          if (parsed < min || parsed > max) {
            return 'Must be between $min and $max';
          }
          return null;
        },
      ),
    );
  }
}
