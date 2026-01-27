#!/bin/bash
set -e

echo "========================================"
echo " Flask + PostgreSQL EC2 Setup (Ubuntu) "
echo "========================================"
echo ""

# 1. Update system
echo "[1/6] Updating system..."
sudo apt update -y && sudo apt upgrade -y

# 2. Install dependencies
echo "[2/6] Installing system dependencies..."
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  postgresql-client \
  git

# 3. Create virtual environment
echo "[3/6] Creating virtual environment..."
python3 -m venv venv

# 4. Install Python dependencies
echo "[4/6] Installing Python dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 5. Ask for DB config
echo ""
echo "[5/6] Database configuration"

read -p "RDS endpoint: " DB_HOST
read -p "Database name: " DB_NAME
read -p "Database user: " DB_USER
read -s -p "Database password: " DB_PASS
echo ""
read -p "Flask SECRET_KEY: " SECRET_KEY

DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@${DB_HOST}:5432/${DB_NAME}"

# 6. Save env vars correctly
echo "[6/6] Saving environment variables..."

sed -i '/DATABASE_URL/d' ~/.profile
sed -i '/SECRET_KEY/d' ~/.profile

echo "export DATABASE_URL=\"$DATABASE_URL\"" >> ~/.profile
echo "export SECRET_KEY=\"$SECRET_KEY\"" >> ~/.profile

echo ""
echo "✅ Setup completed successfully"
echo ""
echo "IMPORTANT NEXT STEPS:"
echo "1️⃣ Run: source ~/.profile"
echo "2️⃣ Run: source venv/bin/activate"
echo "3️⃣ Run: python3 main.py"
echo ""
echo "========================================"
