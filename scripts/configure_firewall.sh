#!/bin/bash

# ==========================================
# Script Name : configure_firewall.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Configure UFW Firewall
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/firewall.conf"

# Load configuration
source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies Firewall Configuration"
echo "========================================="
# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
# Check if UFW is installed
if command -v ufw &>/dev/null; then
    echo "[OK] UFW detected."
else
    echo "[INFO] UFW is not installed."

    read -p "Do you want to install UFW? (y/n): " choice

    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "[INFO] Installing UFW..."

        apt update
        apt install ufw -y

        echo "[OK] UFW installed successfully."
    else
        echo "[INFO] Installation cancelled."
        exit 0
    fi
fi

# Allow SSH port
echo "[INFO] Allowing SSH port..."

ufw allow "$SSH_PORT"/tcp

echo "[OK] SSH port $SSH_PORT allowed."
# Allow HTTP
if [ "$ALLOW_HTTP" = "yes" ]; then
    echo "[INFO] Allowing HTTP..."
    ufw allow 80/tcp
    echo "[OK] HTTP allowed."
fi
# Allow HTTPS
if [ "$ALLOW_HTTPS" = "yes" ]; then
    echo "[INFO] Allowing HTTPS..."
    ufw allow 443/tcp
    echo "[OK] HTTPS allowed."
fi

# Enable Firewall
if [ "$ENABLE_FIREWALL" = "yes" ]; then
    echo "[INFO] Enabling UFW..."

    ufw --force enable

    echo "[OK] UFW enabled."
fi
# Verify Firewall Status
if ufw status | grep -q "Status: active"; then
    echo "[OK] Firewall is active."
else
    echo "[ERROR] Firewall is not active."
    exit 1
fi

