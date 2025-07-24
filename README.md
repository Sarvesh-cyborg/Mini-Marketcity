# Mini MarketCity - Mall Information Website

A simplified mall information website with DBMS implementation, similar to Phoenix Marketcity Chennai.

## Project Structure
```
mini-marketcity/
├── backend/          # Flask backend application
├── frontend/         # HTML, CSS, and JavaScript files
├── database/         # Database setup scripts
└── README.md         # This file
```

## Prerequisites
- Python 3.8 or higher
- MySQL Server 8.0 or higher
- pip (Python package manager)
- Git (optional)

## Setup Instructions

### 1. Database Setup
1. Install MySQL Server if not already installed
2. Create a new database:
   ```sql
   CREATE DATABASE mini_marketcity_db;
   ```
3. Run the database setup script:
   ```bash
   mysql -u your_username -p mini_marketcity_db < database/database_setup.sql
   ```

### 2. Backend Setup
1. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```
2. Install dependencies:
   ```bash
   cd backend
   pip install -r requirements.txt
   ```
3. Create `.env` file:
   ```bash
   cp .env.example .env
   ```
4. Edit `.env` with your database credentials and Flask secret key

### 3. Frontend Setup
1. The frontend files are ready to use and include Tailwind CSS via CDN
2. No additional setup is required for the frontend

### 4. Running the Application
1. Start the Flask backend:
   ```bash
   cd backend
   python app.py
   ```
2. Open your browser and navigate to `http://localhost:5000`

### 5. Admin Access
1. Default admin credentials:
   - Username: admin
   - Password: admin123
2. Access the admin panel at `http://localhost:5000/admin/login`

## Features
- Mall overview and featured brands
- Brands directory with search functionality
- Entertainment zone with events listing
- Interactive mall map
- Lost and found reporting system
- Customer survey system
- Admin panel for content management

## API Endpoints
- Public:
  - `/api/brands` - Get all brands
  - `/api/events` - Get all events
  - `/api/map-zones` - Get map zone information
  - `/api/lost-found/report` - Report lost items
  - `/api/found-items` - View found items
  - `/api/survey/submit` - Submit survey responses

- Admin (protected):
  - `/admin/api/brands` - CRUD operations for brands
  - `/admin/api/events` - CRUD operations for events
  - `/admin/api/lost-found` - Manage lost and found items
  - `/admin/api/survey/results` - View survey results

## Security Notes
- All admin routes are protected and require authentication
- Passwords are hashed using bcrypt
- API endpoints use proper error handling and validation
- Database queries use parameterized statements to prevent SQL injection

## Troubleshooting
If you encounter any issues:
1. Ensure MySQL server is running
2. Verify database credentials in `.env` file
3. Check if all required Python packages are installed
4. Ensure port 5000 is available for the Flask server 