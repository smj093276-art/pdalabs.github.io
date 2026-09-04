-- AI-Based Railway Traffic Optimization & Scheduling System
-- PostgreSQL Normalized Database Schema

CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(64) PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(30) NOT NULL DEFAULT 'PASSENGER', -- 'PASSENGER' or 'ADMIN'
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS stations (
    id VARCHAR(32) PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    station_code VARCHAR(16) UNIQUE NOT NULL,
    is_major BOOLEAN DEFAULT FALSE,
    platform_count INT DEFAULT 6
);

CREATE TABLE IF NOT EXISTS railway_edges (
    id VARCHAR(32) PRIMARY KEY,
    from_station_id VARCHAR(32) REFERENCES stations(id),
    to_station_id VARCHAR(32) REFERENCES stations(id),
    distance_km DOUBLE PRECISION NOT NULL,
    base_time_min INT NOT NULL,
    capacity INT NOT NULL DEFAULT 100,
    base_traffic INT NOT NULL DEFAULT 35
);

CREATE TABLE IF NOT EXISTS trains (
    id VARCHAR(32) PRIMARY KEY,
    train_number VARCHAR(16) UNIQUE NOT NULL,
    train_name VARCHAR(150) NOT NULL,
    type VARCHAR(50) NOT NULL,
    speed_kmh INT NOT NULL
);

CREATE TABLE IF NOT EXISTS train_routes (
    id VARCHAR(32) PRIMARY KEY,
    train_id VARCHAR(32) REFERENCES trains(id),
    source_station_id VARCHAR(32) REFERENCES stations(id),
    destination_station_id VARCHAR(32) REFERENCES stations(id)
);

CREATE TABLE IF NOT EXISTS bookings (
    id VARCHAR(64) PRIMARY KEY,
    user_id VARCHAR(64) REFERENCES users(id),
    train_id VARCHAR(32) REFERENCES trains(id),
    source_station_id VARCHAR(32) REFERENCES stations(id),
    destination_station_id VARCHAR(32) REFERENCES stations(id),
    journey_date DATE NOT NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'CONFIRMED',
    booking_code VARCHAR(32) UNIQUE NOT NULL,
    total_fare NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS passengers (
    id VARCHAR(64) PRIMARY KEY,
    booking_id VARCHAR(64) REFERENCES bookings(id) ON DELETE CASCADE,
    name VARCHAR(150) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(20) NOT NULL,
    coach VARCHAR(10) NOT NULL,
    seat VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS journeys (
    id VARCHAR(64) PRIMARY KEY,
    booking_id VARCHAR(64) REFERENCES bookings(id),
    current_station_id VARCHAR(32) REFERENCES stations(id),
    next_station_id VARCHAR(32) REFERENCES stations(id),
    progress_percent INT DEFAULT 0,
    status VARCHAR(50) NOT NULL DEFAULT 'IN_TRANSIT',
    delay_min INT DEFAULT 0,
    eta VARCHAR(32)
);

CREATE TABLE IF NOT EXISTS journey_stops (
    id VARCHAR(64) PRIMARY KEY,
    journey_id VARCHAR(64) REFERENCES journeys(id) ON DELETE CASCADE,
    station_id VARCHAR(32) REFERENCES stations(id),
    sequence_no INT NOT NULL,
    scheduled_time VARCHAR(32) NOT NULL,
    simulated_arrival VARCHAR(32),
    simulated_departure VARCHAR(32),
    status VARCHAR(32) DEFAULT 'UPCOMING'
);

CREATE TABLE IF NOT EXISTS ai_predictions (
    id VARCHAR(64) PRIMARY KEY,
    journey_id VARCHAR(64) REFERENCES journeys(id),
    predicted_delay INT DEFAULT 0,
    traffic_level VARCHAR(32) DEFAULT 'Low',
    efficiency INT DEFAULT 95,
    confidence INT DEFAULT 98,
    explanation TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
