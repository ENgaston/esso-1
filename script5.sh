#!/bin/bash

# Check for the required argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Check the user in /etc/passwd
if grep -q "^$1:" /etc/passwd; then
    echo "User $1 exists."
else
    echo "User $1 does not exist."
fi
