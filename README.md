# Student Exam Score Prediction Project

This is a full-stack machine learning project aimed at predicting student exam performance based on lifestyle and academic habits. The project is organized into 3 tasks:

- **Task 1**: Build and evaluate machine learning models
- **Task 2**: Deploy the best-performing model using FastAPI
- **Task 3**: Build a mobile Flutter app to interact with the API
- **Task 4**: Demo video

---

## Project Structure

linear_regression_model/
│
├── API/ # FastAPI backend
│ ├── prediction.py # API endpoints & logic
│ ├── scaler.pkl # Scaler used during training
│ ├── best_model_linear_regression.pkl # Trained model
│ ├── requirements.txt # Dependencies for backend
│ └── render.yaml # Render.com deployment config
│
├── FlutterApp/
│ └── flutter_app/ # Flutter mobile application
│ ├── lib/
│ │ ├── main.dart
│ │ └── screens/
│ │ ├── input_screen.dart
│ │ └── result_screen.dart
│ ├── pubspec.yaml
│ └── README.md # App-specific README
│
├── linear_regression/ # Training notebooks
│ └── multivariate-checkpoint.ipynb
│
├── student_habits_performance.csv # Dataset
└── README.md # You're here


---

## Mission Statement

> "To empower youth through data-driven educational tools that improve academic success and mental well-being."

---

## Task 1 – Machine Learning Model

- Preprocessed a dataset of student lifestyle and academic performance.
- Visualized features with histograms and scatter plots.
- Standardized features and trained multiple models:
  - Linear Regression ✅
  - Decision Tree Regressor
  - Random Forest Regressor
- **Selected Model**: Linear Regression (best RMSE)

### Features Used

- `study_hours_per_day`
- `attendance_percentage`
- `sleep_hours`
- `exercise_frequency`
- `mental_health_rating`

---

## Task 2 – FastAPI Backend

- Deployed the best model with FastAPI.
- Enabled CORS for web/mobile clients.
- Scales input using the saved scaler before prediction.
- Deployed live on Render.

### 🔗 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Read Root |
| POST | `/predict_exam_score` | Predicts exam score based on 5 inputs |

### Live API

- **Base URL**: [`https://ml-summative-1dlp.onrender.com`](https://ml-summative-1dlp.onrender.com)
- **Docs**: [`/docs`](https://ml-summative-1dlp.onrender.com/docs)

---

## Task 3 – Flutter App

A mobile app built using Flutter to interact with the deployed API.

### Features

- Clean, mobile-first UI
- Input validation for all 5 fields
- Sends user input to the FastAPI server
- Displays predicted score


### Input Fields

- Study hours per day
- Attendance percentage
- Sleep hours
- Exercise frequency
- Mental health rating

### Screens

- `input_screen.dart`: Collects all input
- `result_screen.dart`: Displays prediction result
- `Splash screen`: Welcome screen
- `About screen` : describes the input fields required

### Run the App

```bash
cd FlutterApp/flutter_app
flutter pub get
flutter run
