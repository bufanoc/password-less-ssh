#!/bin/bash
# Purpose: Setup password-less SSH access for Ansible on CentOS 7 servers
# Usage: Run this script with root privileges

# Generate SSH key if it doesn't already exist
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
fi

# List of server IP addresses
servers="172.24.18.3 172.24.18.4 172.24.18.5"  # Update with actual IP addresses

# Copy SSH key to each server for password-less SSH login
for ip in $servers; do
    echo "Copying SSH key to $ip..."
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@$ip
    if [ $? -eq 0 ]; then
        echo "Key copied successfully to $ip"
    else
        echo "Failed to copy key to $ip"
    fi
done

# Placeholder for additional installation or configuration commands
echo "Additional installation commands go here"
