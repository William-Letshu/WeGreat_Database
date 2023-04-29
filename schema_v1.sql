CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    second_names VARCHAR(255),
    surname VARCHAR(255) NOT NULL,
    identity_document VARCHAR(255) UNIQUE NOT NULL,
    verified BOOLEAN NOT NULL DEFAULT false,
    dob DATE NOT NULL,
    phone_number VARCHAR(255),
    verification_code VARCHAR(255),
    password_reset_code VARCHAR(255),
    disabled BOOLEAN NOT NULL DEFAULT false,
    profile_picture VARCHAR(255),
    merchant_id INTEGER
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
    police_clearance BOOLEAN NOT NULL DEFAULT false,
    verified BOOLEAN NOT NULL DEFAULT false,
    dob DATE NOT NULL,
    phone_number VARCHAR(255),
    verification_code VARCHAR(255),
    password_reset_code VARCHAR(255),
    profile_picture VARCHAR(255),
    user_id INTEGER
);

ALTER TABLE users
ADD CONSTRAINT fk_users_merchant_id
FOREIGN KEY (merchant_id)
REFERENCES merchants(id);

ALTER TABLE merchants
ADD CONSTRAINT fk_merchants_user_id
FOREIGN KEY (user_id)
REFERENCES users(id);

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
    booking_rating INTEGER check (booking_rating between 0 and 5)
);

CREATE TABLE conversations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    merchant_id INTEGER REFERENCES merchants(id)
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    conversation_id INTEGER REFERENCES conversations(id),
    sender_type VARCHAR(50) NOT NULL, -- 'user' or 'merchant'
    sender_id INTEGER NOT NULL, -- either user_id or merchant_id
    content TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

CREATE TABLE service_images (
    id SERIAL PRIMARY KEY,
    service_id INTEGER NOT NULL REFERENCES services(id),
    image_path VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    description TEXT
);

-- Indexes to improve read performance
CREATE INDEX idx_users_identity_document ON users(identity_document);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_merchants_email ON merchants(email);
CREATE INDEX idx_services_merchant_id ON services(merchant_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_service_id ON bookings(service_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_booking_status ON bookings(booking_status);
CREATE INDEX idx_service_images_service_id ON service_images(service_id);
