#!/bin/bash

# ==========================================
# Script Name : backup.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Backup Company Data
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/backup.conf"

source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies Backup System"
echo "========================================="
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
# Check source directory

if [ ! -d "$SOURCE_DIR" ]; then
    echo "[ERROR] Source directory not found."

    exit 1
fi

echo "[OK] Source directory found."

# Create backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[INFO] Creating backup directory..."

    mkdir -p "$BACKUP_DIR"

    echo "[OK] Backup directory created."
else
    echo "[OK] Backup directory already exists."
fi
# Generate backup filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="company_backup_$TIMESTAMP.tar.gz"

echo "[INFO] Backup file: $BACKUP_FILE"
# Create backup
echo "[INFO] Creating backup..."

tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

echo "[OK] Backup created successfully."

# Remove old backups
echo "[INFO] Removing old backups..."

find "$BACKUP_DIR" -name "*.tar.gz" -type f -mtime +"$RETENTION_DAYS" -delete

echo "[OK] Old backups removed."
# Verify backup
if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo "[OK] Backup verification successful."
else
    echo "[ERROR] Backup verification failed."
    exit 1
fi

