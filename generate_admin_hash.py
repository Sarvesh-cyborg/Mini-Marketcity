import bcrypt
import sys

def generate_hash(password):
    # Generate a salt and hash the password
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed.decode('utf-8')

def main():
    if len(sys.argv) != 2:
        print("Usage: python generate_admin_hash.py <password>")
        sys.exit(1)
    
    password = sys.argv[1]
    hashed_password = generate_hash(password)
    
    print("\nGenerated password hash:")
    print(hashed_password)
    print("\nSQL INSERT statement:")
    print(f"INSERT INTO admin_users (username, password_hash) VALUES ('admin', '{hashed_password}');")

if __name__ == "__main__":
    main() 