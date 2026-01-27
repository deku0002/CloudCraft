#!/bin/bash

echo "========================================"
echo " Flask + PostgreSQL EC2 Setup (Ubuntu) "
echo "========================================"
echo ""

# 1. Update system
echo "[1/7] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install system dependencies
echo "[2/7] Installing required system packages..."
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  postgresql-client \
  git

# 3. Create virtual environment
echo "[3/7] Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# 4. Upgrade pip
echo "[4/7] Upgrading pip..."
pip install --upgrade pip

# 5. Install Python dependencies
if [ -f "requirements.txt" ]; then
  echo "[5/7] Installing Python dependencies..."
  pip install -r requirements.txt
else
  echo "❌ requirements.txt not found!"
  exit 1
fi

# 6. Ask for environment variables
echo ""
echo "[6/7] Environment configuration"

read -p "Enter DATABASE_URL (postgresql://user:password@host:5432/dbname): " DATABASE_URL
read -p "Enter SECRET_KEY: " SECRET_KEY

# Export for current shell
export DATABASE_URL="${DATABASE_URL}"
export SECRET_KEY="${SECRET_KEY}"

# Persist across reboots
echo "" >> ~/.bashrc
echo "# Flask app environment variables" >> ~/.bashrc
echo "export DATABASE_URL=\"${DATABASE_URL}\"" >> ~/.bashrc
echo "export SECRET_KEY=\"${SECRET_KEY}\"" >> ~/.bashrc

# 7. Start Flask app
echo ""
echo "[7/7] Starting Flask application..."

# Run Flask in background so SSH doesn't block
nohup python main.py > flask.log 2>&1 &

echo ""
echo "✅ Setup complete!"
echo "Flask app is running in the background."
echo ""
echo "Useful commands:"
echo "  View logs:    tail -f flask.log"
echo "  Stop app:     pkill -f main.py"
echo "  Restart app:  nohup python main.py > flask.log 2>&1 &"
echo ""
echo "Open in browser:"
echo "  http://<EC2_PUBLIC_IP>:5000"
