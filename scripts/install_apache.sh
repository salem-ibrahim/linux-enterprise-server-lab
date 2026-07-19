#!/bin/bash

# ==========================================
# Script Name : install_apache.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Install and configure Apache
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/apache.conf"

# Load configuration
source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies Apache Automation"
echo "========================================="
# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."

# Check if Apache is installed
if dpkg -l | grep -q "^ii  apache2"; then
    echo "[INFO] Apache is already installed."

else
    echo "[INFO] Apache is not installed."

    read -p "Do you want to install Apache? (y/n): " choice

    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "[INFO] Installing Apache..."
        apt update
        apt install apache2 -y
        echo "[OK] Apache installed successfully."

    else
        echo "[INFO] Installation cancelled."
        exit 0
    fi
fi

# Start Apache service
echo "[INFO] Starting Apache service..."
systemctl start apache2

# Enable Apache at boot
echo "[INFO] Enabling Apache service..."
systemctl enable apache2

# Verify Apache service
if systemctl is-active --quiet apache2; then
    echo "[OK] Apache service is running."
else
    echo "[ERROR] Apache service failed to start."
    exit 1
fi

# Create website
echo "[INFO] Creating default web page..."

cat > "$WEB_ROOT/index.html" <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>$SERVER_NAME</title>
</head>
<body>
    <h1>Welcome to $SERVER_NAME</h1>
    <p>Apache installation completed successfully.</p>
</body>
</html>
EOF

echo "[OK] Web page created successfully."
