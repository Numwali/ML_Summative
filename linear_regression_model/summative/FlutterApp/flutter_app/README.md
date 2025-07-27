# Student Exam Score Predictor – Flutter App

This Flutter mobile application allows students to input lifestyle and academic habits and instantly receive a predicted exam score. The app communicates with a FastAPI backend model trained using machine learning.

---

## Features

✅ Beautiful, clean, and responsive UI  
✅ Input form with validation for 5 key lifestyle factors  
✅ Sends data to FastAPI API and displays prediction  
✅ Lightweight and fast  
✅ Runs on both Android and iOS (mobile only)

---

## User Inputs

| Field                  | Type   | Description                                   |
|------------------------|--------|-----------------------------------------------|
| Study hours per day    | Float  | Average daily time spent studying (0–12 hrs)  |
| Attendance percentage  | Float  | Class attendance percentage (0–100%)          |
| Sleep hours            | Float  | Daily sleep duration (0–24 hrs)               |
| Exercise frequency     | Int    | Days of exercise per week (0–7)               |
| Mental health rating   | Float  | Self-assessment of mental well-being (0–10)   |

---

## How It Works

1. User opens the app and sees the **Input Screen**
2. Fills in the five input fields and taps the **"Predict"** button
3. App sends a `POST` request to the FastAPI endpoint
4. The response (predicted exam score) is displayed on the **Result Screen**

---

## API Integration

- **Endpoint**: `https://ml-summative-1dlp.onrender.com/predict_exam_score/docs`
- **Method**: `POST`
- **Request body** (JSON):
```json
{
  "study_hours_per_day": 4,
  "attendance_percentage": 85,
  "sleep_hours": 7,
  "exercise_frequency": 3,
  "mental_health_rating": 8
}

---

## Response

 {
  "predicted_exam_score": 74.5
}

---


## SetUp: 
# Navigate to app folder
cd FlutterApp/flutter_app

# Get dependencies
flutter pub get

# Run the app
flutter run

---

## Folder Structure

lib/
├── main.dart
├── screens/
│   ├── input_screen.dart       # Form UI for user input
│   └── result_screen.dart      # Displays predicted score
├── services/
│   └── api_service.dart        # Handles API call logic



