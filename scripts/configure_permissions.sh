#!/bin/bash

# ==========================================
# Script Name : configure_permissions.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Configure directory permissions
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
COMPANY_DIR="$PROJECT_ROOT/company"
CSV_FILE="$PROJECT_ROOT/configs/permissions.csv"

echo "========================================="
echo " Salem Technologies Permission Automation"
echo "========================================="

# Check root
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

# Check CSV
if [ ! -f "$CSV_FILE" ]; then
    echo "[ERROR] Configuration file not found:"
    echo "$CSV_FILE"
    exit 1
fi

configured=0

while IFS=',' read -r directory group permission
do
    # Skip empty lines
    [ -z "$directory" ] && continue

    # Skip header
    [ "$directory" = "directory" ] && continue

    if [ ! -d "$COMPANY_DIR/$directory" ]; then
        echo "[WARNING] Directory '$directory' does not exist."
        continue
    fi

    chown root:"$group" "$COMPANY_DIR/$directory"
    chmod "$permission" "$COMPANY_DIR/$directory"

    echo "[OK] $directory -> Group: $group | Permission: $permission"

    ((configured++))

done < "$CSV_FILE"

echo
echo "========================================="
echo "Permission configuration completed."
echo "Directories configured: $configured"
echo "========================================="
