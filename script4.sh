#!/bin/bash

# Welcoming message
echo "Welcome to the User Addition Procedure!"

# Prompt user for username and check if it exists
while true; do
    read -p "Enter your desired username: " username

    if id "$username" &> /dev/null; then
        echo "Username $username already exists. Please choose another."
    else
        break
    fi
done

# Prompt user for password
read -sp "Enter your chosen password: " password
echo

# Create the user
sudo useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | sudo chpasswd

# Add user to 'admin' group. Ensure 'admin' group exists or replace with appropriate group name
sudo usermod -aG admin "$username"

# Feedback
echo "User $username successfully added and added to the 'admin' group."

#!/bin/bash

# Welcoming message
echo "Welcome to the User Addition Procedure!"

# Prompt user for username and check if it exists
while true; do
    read -p "Enter your desired username: " username

    if id "$username" &> /dev/null; then
        echo "Username $username already exists. Please choose another."
    else
        break
    fi
done

# Prompt user for password
read -sp "Enter your chosen password: " password
echo

# Create the user
sudo useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | sudo chpasswd

# Add user to 'admin' group. Ensure 'admin' group exists or replace with appropriate group name
sudo usermod -aG admin "$username"

# Feedback
echo "User $username successfully added and added to the 'admin' group."

