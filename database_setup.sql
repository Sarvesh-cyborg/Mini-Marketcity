-- Create the database
CREATE DATABASE IF NOT EXISTS mini_marketcity_db;
USE mini_marketcity_db;

-- Brands table
CREATE TABLE IF NOT EXISTS brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL,
    hours VARCHAR(100) NOT NULL,
    contact VARCHAR(50),
    description TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Events table
CREATE TABLE IF NOT EXISTS events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Map zones table
CREATE TABLE IF NOT EXISTS map_zones (
    zone_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    floor VARCHAR(20) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Lost and found table
CREATE TABLE IF NOT EXISTS lost_and_found (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    date_lost DATE NOT NULL,
    status ENUM('Reported', 'Found', 'Claimed') DEFAULT 'Reported',
    reporter_contact VARCHAR(50) NOT NULL,
    date_reported TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_found TIMESTAMP NULL,
    found_location VARCHAR(100),
    finder_notes TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Survey table
CREATE TABLE IF NOT EXISTS survey (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    age_group VARCHAR(20) NOT NULL,
    visit_frequency VARCHAR(50) NOT NULL,
    favorite_brand VARCHAR(100),
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    suggestions TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Admin users table
CREATE TABLE IF NOT EXISTS admin_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data for brands
INSERT INTO brands (name, category, location, hours, contact, description, image_url) VALUES
('Zara', 'Fashion', 'Ground Floor, Zone A', '10:00 AM - 10:00 PM', '044-1234567', 'International fashion brand offering trendy clothing', 'https://example.com/zara.jpg'),
('Starbucks', 'Food & Beverage', 'First Floor, Zone B', '8:00 AM - 11:00 PM', '044-2345678', 'Premium coffee and beverages', 'https://example.com/starbucks.jpg'),
('Puma', 'Sports', 'Second Floor, Zone C', '10:00 AM - 9:00 PM', '044-3456789', 'Sports and lifestyle brand', 'https://example.com/puma.jpg');

-- Insert sample data for events
INSERT INTO events (title, description, date, time, location, image_url) VALUES
('Summer Fashion Show', 'Annual summer fashion showcase featuring latest trends', '2024-06-15', '19:00:00', 'Central Atrium', 'https://example.com/fashion-show.jpg'),
('Kids Art Workshop', 'Creative art workshop for children aged 5-12', '2024-06-20', '15:00:00', 'Activity Zone', 'https://example.com/art-workshop.jpg');

-- Insert sample data for map zones
INSERT INTO map_zones (name, type, floor, description) VALUES
('Zone A', 'Fashion', 'Ground Floor', 'Premium fashion brands and accessories'),
('Zone B', 'Food Court', 'First Floor', 'Dining area with various cuisines'),
('Zone C', 'Entertainment', 'Second Floor', 'Cinema and gaming zone');

-- Insert sample data for lost and found
INSERT INTO lost_and_found (item_name, description, date_lost, status, reporter_contact) VALUES
('Wallet', 'Black leather wallet with ID cards', '2024-05-01', 'Reported', 'john@example.com'),
('Phone', 'iPhone 13, black case', '2024-05-02', 'Found', 'sarah@example.com');

-- Insert sample data for survey
INSERT INTO survey (age_group, visit_frequency, favorite_brand, rating, suggestions) VALUES
('18-25', 'Weekly', 'Zara', 5, 'Great selection of brands'),
('26-35', 'Monthly', 'Starbucks', 4, 'Could use more seating areas');

-- Note: Admin user will be created using the generate_admin_hash.py script 