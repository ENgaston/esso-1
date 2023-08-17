#!/bin/bash

# Welcoming message
echo "Welcome to the User Addition Procedure!"

# Prompt for the username
read -p "Please input your desired username: " username

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "The user $username already exists."
    exit 1
fi

# Prompt for the password securely
read -sp "Please securely enter your chosen password: " password
echo ""

# Add user with specified username and password
echo "$password" | sudo adduser --quiet --disabled-password --gecos "" "$username"
echo "$username:$password" | sudo chpasswd

# Add the user to the "admin" group
sudo usermod -aG admin "$username"

# Create a home directory (it is normally created by default)
# If you want to specify a non-default location, you can modify the command
# sudo mkdir "/path/to/directory/$username"

# Set the owner of the home directory to the newly created user
# sudo chown "$username:$username" "/path/to/directory/$username"

# Feedback
echo "User $username has been successfully added and is now a member of the 'admin' group."

