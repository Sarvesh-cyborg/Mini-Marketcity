USE mini_marketcity_db;

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