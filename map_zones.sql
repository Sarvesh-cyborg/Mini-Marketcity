USE mini_marketcity_db;

-- Clear existing data
DELETE FROM map_zones;

-- Insert new map zones
INSERT INTO map_zones (name, description, coordinates, image_url) VALUES
('Food Court', 'Main dining area with various food options', '{"x": 100, "y": 200, "width": 300, "height": 150}', '/static/images/food-court.png'),
('Fashion Zone', 'Clothing and accessories stores', '{"x": 400, "y": 200, "width": 300, "height": 150}', '/static/images/fashion-zone.png'),
('Entertainment Zone', 'Cinema and gaming area', '{"x": 100, "y": 400, "width": 300, "height": 150}', '/static/images/entertainment-zone.png'),
('Electronics Zone', 'Gadgets and electronics stores', '{"x": 400, "y": 400, "width": 300, "height": 150}', '/static/images/electronics-zone.png'); 