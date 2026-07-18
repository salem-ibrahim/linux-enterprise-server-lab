#!/bin/bash

echo "==============================="
echo " salem tech user automation "
echo "==============================="

CSV_FILE="../configs/users.csv"
created=0
while IFS=',' read -r username group
do
if id "$username" &>/dev/null
then
	echo "[INFO] User '$username' already exists."
else
	useradd -m -G "$group" "$username"
	echo "[OK] User '$username' created and added to '$group'."
((created++))
fi
done < <(tail -n +2 "$CSV_FILE")
echo
echo "Users created: $created"
