CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    second_names VARCHAR(255),
    surname VARCHAR(255) NOT NULL,
    identity_document VARCHAR(255) UNIQUE NOT NULL,
    disabled BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE merchants (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    second_names VARCHAR(255),
    surname VARCHAR(255) NOT NULL,
    description TEXT,
    police_clearance BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    merchant_id INTEGER REFERENCES merchants(id),
    service_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    service_id INTEGER REFERENCES services(id),
    booking_date TIMESTAMP NOT NULL,
    booking_status VARCHAR(50) NOT NULL,
    booking_rating INTEGER check (booking_rating between 0 and 5),
);

-- Indexes to improve read performance
CREATE INDEX idx_users_identity_number ON users(identity_number);
CREATE INDEX idx_users_email_address ON users(email_address);
CREATE INDEX idx_merchants_identity_document ON merchants(identity_document);
CREATE INDEX idx_services_merchant_id ON services(merchant_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_service_id ON bookings(service_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_booking_status ON bookings(booking_status);
