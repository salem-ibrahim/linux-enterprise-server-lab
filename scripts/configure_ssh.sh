#!/bin/bash

# ==========================================
# Script Name : configure_ssh.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Configure and secure SSH
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/ssh.conf"

# Load configuration
source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies SSH Configuration"
echo "========================================="
# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
# Check if SSH is installed
if ! command -v sshd &>/dev/null; then
    echo "[ERROR] OpenSSH Server is not installed."
    exit 1
fi

echo "[OK] OpenSSH Server detected."

# SSH configuration file
SSH_CONFIG="/etc/ssh/sshd_config"

# Backup configuration
echo "[INFO] Creating backup..."

cp "$SSH_CONFIG" "$SSH_CONFIG.bak"

echo "[OK] Backup created: $SSH_CONFIG.bak"
# Configure SSH Port
echo "[INFO] Configuring SSH port..."

sed -i "s/^#*Port .*/Port $SSH_PORT/" "$SSH_CONFIG"

echo "[OK] SSH port configured: $SSH_PORT"

# Configure Root Login
echo "[INFO] Configuring PermitRootLogin..."

sed -i "s/^#*PermitRootLogin .*/PermitRootLogin $PERMIT_ROOT_LOGIN/" "$SSH_CONFIG"

echo "[OK] PermitRootLogin configured: $PERMIT_ROOT_LOGIN"

# Configure Password Authentication
echo "[INFO] Configuring PasswordAuthentication..."

sed -i "s/^#*PasswordAuthentication .*/PasswordAuthentication $PASSWORD_AUTHENTICATION/" "$SSH_CONFIG"

echo "[OK] PasswordAuthentication configured: $PASSWORD_AUTHENTICATION"

# Validate SSH configuration
echo "[INFO] Validating SSH configuration..."

if sshd -t; then
    echo "[OK] SSH configuration is valid."
else
    echo "[ERROR] Invalid SSH configuration."
    exit 1
fi

# Restart SSH service
echo "[INFO] Restarting SSH service..."

systemctl restart ssh
# Verify SSH service
if systemctl is-active --quiet ssh; then
    echo "[OK] SSH service is running."
else
    echo "[ERROR] SSH service failed to start."
    exit 1
fi

