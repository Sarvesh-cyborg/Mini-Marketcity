import sys
print("Python executable in use:", sys.executable)

from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
import mysql.connector
from dotenv import load_dotenv
import os
import json

# Load environment variables
load_dotenv()

app = Flask(__name__, 
            static_folder='static',  # Specify the static folder
            static_url_path='/static')  # Specify the URL path for static files
CORS(app)  # Enable CORS for all routes
app.secret_key = os.getenv('FLASK_SECRET_KEY', 'your-secret-key-here')

# MySQL Configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Rambo@20',  # Empty password
    'database': 'mini_marketcity_db',
    'port': 3306,
    'use_pure': True
}

def get_db():
    try:
        print("Attempting to connect to MySQL...")
        conn = mysql.connector.connect(**db_config)
        print("Successfully connected to MySQL")
        return conn
    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
        raise

# API Routes for Brands
@app.route('/api/brands')
def get_brands():
    try:
        print("Getting database connection...")
        conn = get_db()
        print("Creating cursor...")
        cur = conn.cursor()
        print("Executing query...")
        cur.execute("SELECT * FROM brands")
        print("Fetching results...")
        brands = cur.fetchall()
        print(f"Found {len(brands)} brands")
        cur.close()
        conn.close()
        return jsonify([{
            'brand_id': brand[0],
            'name': brand[1],
            'category': brand[2],
            'location': brand[3],
            'hours': brand[4],
            'contact': brand[5],
            'description': brand[6],
            'image_url': brand[7]
        } for brand in brands])
    except Exception as e:
        print(f"Error in get_brands: {str(e)}")
        return jsonify({'error': str(e)}), 500

# API Routes for Events
@app.route('/api/events')
def get_events():
    cur = get_db().cursor()
    cur.execute("SELECT * FROM events")
    events = cur.fetchall()
    cur.close()
    return jsonify([{
        'event_id': event[0],
        'title': event[1],
        'description': event[2],
        'date': str(event[3]),
        'time': str(event[4]),
        'location': event[5],
        'image_url': event[6]
    } for event in events])

# API Routes for Lost and Found
@app.route('/api/lost-found/report', methods=['POST'])
def report_lost_item():
    try:
        data = request.get_json()
        conn = get_db()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO lost_and_found (item_name, description, date_lost, reporter_contact)
            VALUES (%s, %s, %s, %s)
        """, (data['item_name'], data['description'], data['date_lost'], data['reporter_contact']))
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({'message': 'Item reported successfully'})
    except Exception as e:
        print(f"Error in report_lost_item: {str(e)}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/found-items')
def get_found_items():
    try:
        conn = get_db()
        cur = conn.cursor()
        cur.execute("SELECT * FROM lost_and_found WHERE status = 'Found'")
        items = cur.fetchall()
        cur.close()
        conn.close()
        return jsonify([{
            'item_id': item[0],
            'item_name': item[1],
            'description': item[2],
            'date_lost': str(item[3]),
            'status': item[4],
            'date_found': str(item[7]) if item[7] else None,
            'found_location': item[8]
        } for item in items])
    except Exception as e:
        print(f"Error in get_found_items: {str(e)}")
        return jsonify({'error': str(e)}), 500

@app.route('/')
def index():
    return send_from_directory('../frontend', 'index.html')

@app.route('/<path:path>')
def serve_static(path):
    if path.startswith('static/'):
        return send_from_directory('static', path[7:])  # Serve static files from backend/static
    return send_from_directory('../frontend', path)

# API Routes for Map Zones
@app.route('/api/map-zones')
def get_map_zones():
    try:
        conn = get_db()
        cur = conn.cursor()
        cur.execute("SELECT * FROM map_zones")
        zones = cur.fetchall()
        cur.close()
        conn.close()
        return jsonify([{
            'zone_id': zone[0],
            'name': zone[1],
            'description': zone[2],
            'coordinates': json.loads(zone[3]) if zone[3] else None,
            'image_url': zone[4]
        } for zone in zones])
    except Exception as e:
        print(f"Error in get_map_zones: {str(e)}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True) 