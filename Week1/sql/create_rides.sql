DROP TABLE IF EXISTS rides;

CREATE TABLE rides (
    ride_id          INT PRIMARY KEY,
    driver_name      VARCHAR(100) NOT NULL,
    passenger_name   VARCHAR(100) NOT NULL,
    pickup_city      VARCHAR(100) NOT NULL,
    dropoff_city     VARCHAR(100) NOT NULL,
    fare_amount      NUMERIC(10,2) NOT NULL CHECK (fare_amount >= 0),
    ride_distance_km NUMERIC(8,2) NOT NULL CHECK (ride_distance_km > 0),
    ride_status      VARCHAR(20) NOT NULL CHECK (ride_status IN ('completed', 'cancelled', 'no_show')),
    requested_at     TIMESTAMP NOT NULL,
    completed_at     TIMESTAMP,
    rating           NUMERIC(3,1) CHECK (rating BETWEEN 1.0 AND 5.0),
    payment_method   VARCHAR(20) CHECK (payment_method IN ('cash', 'card', 'esewa', 'khalti')),

    CONSTRAINT completed_at_check CHECK (
        (ride_status = 'completed' AND completed_at IS NOT NULL) OR
        (ride_status != 'completed' AND completed_at IS NULL)
    )
);