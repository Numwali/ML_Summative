from fastapi import FastAPI
from pydantic import BaseModel, Field
from fastapi.middleware.cors import CORSMiddleware
import joblib
import numpy as np

app = FastAPI()

# Allow CORS (cross-origin requests)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load the saved model
model = joblib.load("best_model_linear_regression.pkl")

# Define the input schema
class ExamScoreInput(BaseModel):
    age: int = Field(..., ge=10, le=60)
    study_hours_per_day: float = Field(..., ge=0.0, le=12.0)
    social_media_hours: float = Field(..., ge=0.0, le=12.0)
    netflix_hours: float = Field(..., ge=0.0, le=12.0)
    part_time_job: int = Field(..., ge=0, le=1)
    attendance_percentage: float = Field(..., ge=0.0, le=100.0)
    sleep_hours: float = Field(..., ge=0.0, le=24.0)
    exercise_frequency: int = Field(..., ge=0, le=7)
    mental_health_rating: float = Field(..., ge=0.0, le=10.0)

@app.post("/predict")
def predict(data: ExamScoreInput):
    # Convert to model input format
    features = np.array([[ 
        data.age,
        data.study_hours_per_day,
        data.social_media_hours,
        data.netflix_hours,
        data.part_time_job,
        data.attendance_percentage,
        data.sleep_hours,
        data.exercise_frequency,
        data.mental_health_rating
    ]])
    # Make prediction
    prediction = model.predict(features)
    return {"predicted_exam_score": round(float(prediction[0]), 2)}
