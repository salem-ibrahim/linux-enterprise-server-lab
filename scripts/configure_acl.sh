#!/bin/bash

# ==========================================
# Script Name : configure_acl.sh
# Author      : Salem Ibrahim
# Project     : Linux Enterprise Server Lab
# Description : Configure ACL permissions
# ==========================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
COMPANY_DIR="$PROJECT_ROOT/company"
CSV_FILE="$PROJECT_ROOT/configs/acl.csv"

echo "========================================="
echo " Salem Technologies ACL Automation"
echo "========================================="

# Check for root
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run this script as root."
    exit 1
fi

# Check CSV
if [ ! -f "$CSV_FILE" ]; then
    echo "[ERROR] ACL configuration file not found."
    exit 1
fi

configured=0

while IFS=',' read -r directory user permission
do
    # Skip empty lines
    [ -z "$directory" ] && continue

    # Skip header
    [ "$directory" = "directory" ] && continue

    # Check directory exists
    if [ ! -d "$COMPANY_DIR/$directory" ]; then
        echo "[WARNING] Directory '$directory' not found."
        continue
    fi

    # Check user exists
    if ! id "$user" &>/dev/null; then
        echo "[WARNING] User '$user' does not exist."
        continue
    fi

    setfacl -m u:$user:$permission "$COMPANY_DIR/$directory"

    echo "[OK] $user -> $directory ($permission)"

    ((configured++))

done < "$CSV_FILE"

echo
echo "========================================="
echo "ACL configuration completed."
echo "ACL entries configured: $configured"
echo "========================================="
