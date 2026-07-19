#!/bin/bash

# ==========================================
# Script Name : setup_company.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Complete Company Setup
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"

echo "========================================="
echo " Salem Technologies Setup Wizard"
echo "========================================="
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
echo
echo "[INFO] Creating groups..."
bash "$PROJECT_ROOT/scripts/create_groups.sh"

echo
echo "[INFO] Creating users..."
bash "$PROJECT_ROOT/scripts/create_users.sh"

echo
echo "[INFO] Creating directories..."
bash "$PROJECT_ROOT/scripts/create_directories.sh"

echo
echo "[INFO] Configuring permissions..."
bash "$PROJECT_ROOT/scripts/configure_permissions.sh"

echo
echo "[INFO] Configuring ACL..."
bash "$PROJECT_ROOT/scripts/configure_acl.sh"

echo
echo "[INFO] Installing Apache..."
bash "$PROJECT_ROOT/scripts/install_apache.sh"

echo
echo "[INFO] Configuring SSH..."
bash "$PROJECT_ROOT/scripts/configure_ssh.sh"

echo
echo "[INFO] Configuring Firewall..."
bash "$PROJECT_ROOT/scripts/configure_firewall.sh"

echo
echo "[INFO] Configuring Backup Cron..."
bash "$PROJECT_ROOT/scripts/cron_setup.sh"

echo
echo "========================================="
echo "[OK] Company setup completed successfully."
echo "========================================="

