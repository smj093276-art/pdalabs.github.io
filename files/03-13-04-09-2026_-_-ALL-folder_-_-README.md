# AI-Based Railway Traffic Optimization & Scheduling System

A full-stack, production-grade web application with real-time graph routing, dynamic traffic scheduling, animated train tracking, explainable AI delay predictions, and a hidden administrator control center.

Built strictly according to **Reference Image 1 (Login Page)** and **Reference Image 2 (My Railway Journey / India Map Dashboard)**.

---

## 📸 Visual References & Design Fidelity

1. **Login Page (`LoginPage.tsx`)**:
   - Matches **Reference Image 1** with high-speed railway hero visual on the left, dark navy aesthetic, rounded white auth card on the right, circular blue lock badge, password toggle, and remember-me option.
   - **Hidden Admin Mode**: Press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd> on the login page to launch the discreet Admin Dispatcher Gateway (`Sampathraj` / `cs128`).
   - **Passenger Mode**: Accepts any non-empty username/password for instant demonstration.

2. **My Railway Journey Dashboard (`JourneyDashboard.tsx`)**:
   - Matches **Reference Image 2** with 3-column control center layout:
     - **Left Column**: Journey Status Card (Bhopal Junction -> Nagpur -> Mumbai Central), AI Journey Analysis Card (94% Efficiency, Low Traffic, 0 min Predicted Delay, 99% AI Confidence), Disclaimer.
     - **Center Column**: Interactive India Railway Map with glowing warm amber/gold selected route, dim cyan background network, 30+ major and regional stations across India, zoom/pan controls, and smoothly interpolating animated train marker with glowing trail.
     - **Right Column**: Journey Timeline (Passed with green check, Current pulsing orange/cyan node, Upcoming), Train Animation Strip, and AI Route Optimization Step Card.
     - **Bottom Bar**: Distance (1,386 km), Avg. Speed (76 km/h), Journey Time (16h 15m), Stops (4), Platform (5), Coach (B2).

---

## 🚀 Quick Start Guide

### 1. Start the React Frontend
```bash
cd frontend
npm install
npm run dev
```
*Frontend runs on `http://localhost:5173`*

### 2. Start the Express Backend (Optional / REST API)
```bash
cd backend
npm install
npm run dev
```
*Backend runs on `http://localhost:5000`*

### 3. Start the Python 3.14 AI Microservice (FastAPI)
```bash
cd ai_service
pip install -r requirements.txt
python app.py
```
*AI Microservice runs on `http://localhost:8000`*

---

## 🚆 Dynamic Cross-India Routes for Demo Testing

The application supports journeys between **ANY station in India**:
- **Delhi → Mumbai**: High-speed western spine (Reference route).
- **Kolkata → Bengaluru**: East-to-South cross-country corridor.
- **Chennai → Jaipur**: South-to-North trunk line.
- **Ahmedabad → Guwahati**: Trans-India West-to-Northeast route.
- **Kochi → Lucknow**: South-to-North corridor with dynamic ETA.

---

## 🔐 Demonstration Credentials

- **Passenger Portal**: Any username & password (e.g., `Rahul Verma` / `passenger123`)
- **Admin Portal Access**:
  - Shortcut: Press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd> on the Login Page.
  - Username: `Sampathraj`
  - Password: `cs128`

---

## 🛠️ Technology Stack

- **Frontend**: React.js 18 + TypeScript + Vite + Tailwind CSS + Lucide React + Canvas / SVG Projection.
- **Backend API**: Node.js + Express.js + REST API + CORS.
- **Database**: PostgreSQL schema (`schema.sql`) with instant demo fallback.
- **AI Microservice**: Python 3.14 + FastAPI + Pydantic.

---

## ⚠️ Disclaimer
*Simulated Real-Time Journey Status — Synthetic journey data for academic demonstration purposes.*
