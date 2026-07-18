#!/bin/bash

echo "==============================="
echo " salem tech group automation "
echo "==============================="

groups=("it" "hr" "finance")
for group in "${groups[@]}"
do
	if getent group "$group" > /dev/null; then
	   echo "[INFO] Group '$group' already exists."
	else groupadd "$group"
		echo "[ok] Group '$group' created successfull."
	fi
done
echo
echo "group provisioning completed."

