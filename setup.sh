#!/bin/bash
set -e

echo "=============================================="
echo "   CloudCraft Flask App – EC2 Setup ☁️"
echo "=============================================="
echo ""

# -------------------------------
# STEP 1: Update system
# -------------------------------
echo "[1/5] Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# -------------------------------
# STEP 2: Install system dependencies
# -------------------------------
echo "[2/5] Installing required system packages..."
sudo apt install -y \
  python3 \
  python3-venv \
  python3-pip \
  git \
  libpq-dev \
  postgresql-client

# -------------------------------
# STEP 3: Create virtual environment
# -------------------------------
echo "[3/5] Setting up Python virtual environment..."
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

source venv/bin/activate

# -------------------------------
# STEP 4: Install Python dependencies
# -------------------------------
echo "[4/5] Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# -------------------------------
# STEP 5: Finish
# -------------------------------
echo ""
echo "[5/5] Setup completed successfully 🚀"
echo ""
echo "NEXT STEPS:"
echo "1️⃣ source venv/bin/activate"
echo "2️⃣ python main.py"
echo ""
echo "Open your app in browser:"
echo "http://<EC2_PUBLIC_IP>:5000"
echo ""
echo "=============================================="
echo " CloudCraft is LIVE ☁️"
echo "=============================================="
