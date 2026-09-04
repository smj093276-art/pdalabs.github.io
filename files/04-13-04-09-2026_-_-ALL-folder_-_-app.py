"""
AI-Based Railway Traffic Optimization & Scheduling Microservice
Compatible with Python 3.14+
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import math
import datetime

app = FastAPI(
    title="AI Railway Optimization Microservice",
    description="Python 3.14 FastAPI service for train route optimization and delay prediction",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Pydantic Request / Response Models
class RouteOptimizationRequest(BaseModel):
    source_id: str
    destination_id: str
    train_speed_kmh: Optional[int] = 90
    simulated_traffic_level: Optional[str] = "Moderate"
    time_of_day: Optional[str] = "16:00"

class DelayPredictionRequest(BaseModel):
    route_distance_km: float
    num_stops: int
    train_speed_kmh: int
    station_congestion_level: Optional[str] = "Moderate"
    weather_condition: Optional[str] = "Clear"

class JourneyAnalysisRequest(BaseModel):
    journey_id: str
    current_progress: float
    stops: List[str]

@app.get("/api/ai/health")
def health_check():
    return {
        "status": "healthy",
        "service": "AI Railway Optimization & Scheduling Microservice",
        "python_version": "3.14",
        "simulation": True,
        "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat()
    }

@app.post("/api/ai/optimize-route")
def optimize_route(req: RouteOptimizationRequest):
    traffic_penalties = {"Low": 0.05, "Moderate": 0.15, "High": 0.35, "Critical": 0.60}
    penalty = traffic_penalties.get(req.simulated_traffic_level, 0.15)
    
    efficiency = max(82, int(98 - (penalty * 30)))
    predicted_delay = 0 if req.simulated_traffic_level in ["Low", "Moderate"] else int(penalty * 20)
    confidence = 99 if efficiency > 90 else 94

    return {
        "source": req.source_id,
        "destination": req.destination_id,
        "recommended_route": f"{req.source_id} -> AI_OPTIMIZED_CORRIDOR -> {req.destination_id}",
        "traffic_level": req.simulated_traffic_level,
        "route_efficiency": efficiency,
        "predicted_delay_minutes": predicted_delay,
        "confidence_score": confidence,
        "explanation": "Route selected because it minimizes estimated travel time while maintaining lower simulated congestion across critical junction segments.",
        "simulation": True
    }

@app.post("/api/ai/predict-delay")
def predict_delay(req: DelayPredictionRequest):
    # Regression model simulation
    base_delay = 0
    if req.station_congestion_level == "High":
        base_delay += 8
    elif req.station_congestion_level == "Critical":
        base_delay += 22

    if req.weather_condition in ["Heavy Rain", "Fog"]:
        base_delay += 12

    delay = max(0, int(base_delay + (req.num_stops * 0.5)))
    reliability = "High" if delay < 5 else "Medium" if delay < 15 else "Low"

    return {
        "predicted_delay_minutes": delay,
        "schedule_reliability": reliability,
        "ai_confidence": 98.4,
        "risk_factors": {
            "congestion": req.station_congestion_level,
            "stops_penalty": req.num_stops * 0.5,
            "weather": req.weather_condition
        },
        "simulation": True
    }

@app.post("/api/ai/analyze-journey")
def analyze_journey(req: JourneyAnalysisRequest):
    return {
        "journey_id": req.journey_id,
        "current_progress_percent": round(req.current_progress * 100, 1),
        "traffic_status": "Normal",
        "route_efficiency": 94,
        "ai_confidence": 99,
        "safety_margin": "Optimal",
        "simulation": True
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
