#!/bin/bash

# ==========================================
# Script Name : cron_setup.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Configure Backup Cron Job
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/cron.conf"

source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies Cron Setup"
echo "========================================="
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
# Check backup script
if [ ! -f "$BACKUP_SCRIPT" ]; then
    echo "[ERROR] Backup script not found."
    exit 1
fi

echo "[OK] Backup script found."
echo "[INFO] Configuring cron job..."

(
    crontab -l 2>/dev/null
    echo "$BACKUP_SCHEDULE $BACKUP_SCRIPT"
) | crontab -

echo "[OK] Cron job configured."
echo
echo "Current Cron Jobs:"
crontab -l

