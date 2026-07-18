#!/bin/bash 

# ===================================================
# Script Name : create-directories.sh
# Author : Salem Ibrahim
# Project : Linux Enterprise Server Lab
# Descripation : create company directories from CSV
# ===================================================

PROJECT_ROOT="/srv/project/linux-enterprise-server-lab"
COMPANY_DIR="$PROJECT_ROOT/company"
CSV_FILE="$PROJECT_ROOT/configs/directories.csv"

echo "======================================"
echo " Salem Ibrahim Directory Automation"
echo "======================================"

# Check if CSV exists 
echo "CSV_FILE = $CSV_FILE"
ls -l "$CSV_FILE"

if [ ! -f "$CSV_FILE" ]; then
	echo "[ERROR] directories.csv not found"
	echo "$CSV_FILE"
	exit 1
fi
created=0

while IFS=',' read -r directory
do 
# Skip header 
if [ "$directory" = "directory" ] ; then
	continue
fi
if [ -d "$COMPANY_DIR/$directory" ]; then
echo "[INFO] Directory '$directory' already exists."
else 
mkdir -p "$COMPANY_DIR/$directory"
echo "[OK] Directory '$directory' created."
((created++))
fi
done < "$CSV_FILE"

echo

echo "======================================"
echo "Directory provisioning completed"
echo "Directories created : $created"
echo "======================================"
