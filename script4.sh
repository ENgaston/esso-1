#!/bin/bash

# Function to check if a user exists
user_exists() {
    if id "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Welcoming message
echo "Welcome to the New User Addition Procedure!"

# Prompt for the username
while true; do
    read -p "Please input your desired username: " username
    if user_exists "$username"; then
        echo "Username $username already exists. Try a different one."
    else
        break
    fi
done

# Prompt for the password securely
read -sp "Please securely enter your chosen password: " password
echo ""

# Add user with specified username
sudo useradd -m -s /bin/bash "$username"

# If the previous command executed successfully, set the password
if [ $? -eq 0 ]; then
    echo "$username:$password" | sudo chpasswd
else
    echo "Failed to add user $username. Exiting."
    exit 1
fi

# Add the user to the "admin" group (make sure it exists)
if grep -q "^admin:" /etc/group; then
    sudo usermod -aG admin "$username"
else
    echo "Admin group doesn't exist. Skipping this step."
fi

# Feedback
echo "User $username has been successfully added!"
if grep -q "^admin:" /etc/group; then
    echo "User $username is now a member of the 'admin' group."
fi
