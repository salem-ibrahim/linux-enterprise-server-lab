#!/bin/bash

# ==========================================
# Script Name : restore.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Restore Company Backup
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
CONFIG_FILE="$PROJECT_ROOT/configs/backup.conf"

source "$CONFIG_FILE"

echo "========================================="
echo " Salem Technologies Restore System"
echo "========================================="
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

echo "[OK] Running as root."
# Check backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[ERROR] Backup directory not found."
    exit 1
fi

echo "[OK] Backup directory found."
# Check for backup files
if ! ls "$BACKUP_DIR"/*.tar.gz >/dev/null 2>&1; then
    echo "[ERROR] No backup files found."
    exit 1
fi

echo "[OK] Backup files detected."
# List available backups
echo
echo "Available Backups:"
echo "-------------------"

BACKUPS=("$BACKUP_DIR"/*.tar.gz)

for i in "${!BACKUPS[@]}"; do
    echo "$((i+1))) $(basename "${BACKUPS[$i]}")"
done
echo
read -p "Select backup number: " CHOICE
# Validate selection
if ! [[ "$CHOICE" =~ ^[0-9]+$ ]] || [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt "${#BACKUPS[@]}" ]; then
    echo "[ERROR] Invalid selection."
    exit 1
fi
SELECTED_BACKUP="${BACKUPS[$((CHOICE-1))]}"

echo "[OK] Selected backup: $(basename "$SELECTED_BACKUP")"

echo
read -p "This will overwrite the current company directory. Continue? (y/n): " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "[INFO] Restore cancelled."
    exit 0
fi

# Remove current company directory
echo "[INFO] Removing current company directory..."

rm -rf "$SOURCE_DIR"

echo "[OK] Current company directory removed."
# Restore backup
echo "[INFO] Restoring backup..."

tar -xzf "$SELECTED_BACKUP" -C "$(dirname "$SOURCE_DIR")"

echo "[OK] Backup restored successfully."
# Verify restore
if [ -d "$SOURCE_DIR" ]; then
    echo "[OK] Restore verification successful."
else
    echo "[ERROR] Restore verification failed."
    exit 1
fi

