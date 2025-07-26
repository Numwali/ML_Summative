from fastapi import FastAPI
from pydantic import BaseModel, Field
from fastapi.middleware.cors import CORSMiddleware
import joblib
import numpy as np

app = FastAPI(
    title="Student Exam Score Predictor API",
    description="This API predicts a student's exam score based on input lifestyle and academic factors.",
    version="1.0.0"
)

# Allow CORS (cross-origin requests)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load the saved model
model = joblib.load("best_model_linear_regression.pkl")
scaler = joblib.load("scaler.pkl")

# Root endpoint
@app.get("/")
def read_root():
    return {"message": "Welcome to the Student Exam Score Predictor API"}

# Define the input schema
class ExamScoreInput(BaseModel):
    study_hours_per_day: float = Field(..., ge=0.0, le=12.0)
    attendance_percentage: float = Field(..., ge=0.0, le=100.0)
    sleep_hours: float = Field(..., ge=0.0, le=24.0)
    exercise_frequency: int = Field(..., ge=0, le=7)
    mental_health_rating: float = Field(..., ge=0.0, le=10.0)

# Prediction endpoint
@app.post("/predict_exam_score")
def predict(data: ExamScoreInput):
    # Convert to model input format
    features = np.array([[ 
        data.study_hours_per_day,
        data.attendance_percentage,
        data.sleep_hours,
        data.exercise_frequency,
        data.mental_health_rating
    ]])
    
    # Apply the scaler
    scaled_features = scaler.transform(features)

    # Make prediction
    prediction = model.predict(scaled_features)
    return {"predicted_exam_score": round(float(prediction[0]), 2)/5}