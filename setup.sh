#!/bin/bash
set -e

echo "========================================"
echo " Flask + PostgreSQL EC2 Setup (Ubuntu) "
echo "========================================"
echo ""

### 1. Update system
echo "[1/7] Updating system..."
sudo apt update -y && sudo apt upgrade -y

### 2. Install system dependencies
echo "[2/7] Installing system dependencies..."
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  postgresql-client \
  git

### 3. Create virtual environment
echo "[3/7] Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

### 4. Upgrade pip
echo "[4/7] Upgrading pip..."
pip install --upgrade pip

### 5. Install Python dependencies
echo "[5/7] Installing Python dependencies..."
if [ ! -f requirements.txt ]; then
  echo "❌ requirements.txt not found!"
  exit 1
fi
pip install -r requirements.txt

### 6. Ask for database details
echo ""
echo "[6/7] Database configuration"

read -r -p "Enter RDS endpoint (example: database-1.xxxx.ap-south-1.rds.amazonaws.com): " DB_HOST
read -r -p "Enter database name (example: notes_app): " DB_NAME
read -r -p "Enter database username (example: postgres): " DB_USER
read -s -r -p "Enter database password: " DB_PASSWORD
echo ""

read -r -p "Enter Flask SECRET_KEY: " SECRET_KEY

### 7. Construct DATABASE_URL safely
DATABASE_URL="postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:5432/${DB_NAME}"

echo ""
echo "[7/7] Saving environment variables..."

# Remove old values if present
sed -i '/^export DATABASE_URL=/d' ~/.bashrc
sed -i '/^export SECRET_KEY=/d' ~/.bashrc

# Persist variables
echo "export DATABASE_URL=\"${DATABASE_URL}\"" >> ~/.bashrc
echo "export SECRET_KEY=\"${SECRET_KEY}\"" >> ~/.bashrc

# Export for current session
export DATABASE_URL="${DATABASE_URL}"
export SECRET_KEY="${SECRET_KEY}"

echo ""
echo "✅ Environment variables configured successfully!"
echo ""
echo "DATABASE_URL constructed as:"
echo "$DATABASE_URL"
echo ""
echo "Next steps:"
echo "1. source ~/.bashrc"
echo "2. source venv/bin/activate"
echo "3. python3 main.py"
echo ""
echo "========================================"
echo " Setup completed successfully 🚀"
echo "========================================"
