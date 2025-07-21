#!/bin/bash
# Linux System Hardening Script
# This script sets file permissions, creates users and groups, and runs Lynis audit.

# Step 1: Set permissions on sensitive files
echo "Setting permissions on sensitive files..."
sudo chmod 640 /etc/shadow
sudo chmod 640 /etc/gshadow
sudo chmod 644 /etc/group
sudo chmod 644 /etc/passwd
echo "Permissions updated."

# Step 2: Create user accounts
echo "Creating user accounts..."
sudo useradd sam
sudo useradd joe
sudo useradd amy
sudo useradd sara
sudo useradd admin1
echo "Users created."

# Step 3: Add sudo privileges to admin1
echo "Adding admin1 to sudo group..."
sudo usermod -aG sudo admin1
echo "admin1 added to sudo group."

# Step 4: Create group and add users to it
echo "Creating group 'engineers' and adding users..."
sudo groupadd engineers
sudo usermod -aG engineers sam
sudo usermod -aG engineers joe
sudo usermod -aG engineers amy
sudo usermod -aG engineers sara
echo "Group and membership configured."

# Step 5: Create shared folder and set ownership
echo "Creating shared folder /home/engineers..."
sudo mkdir -p /home/engineers
sudo chown :engineers /home/engineers
sudo chmod 770 /home/engineers
echo "Shared folder created and permissions set."

# Step 6: Install and run Lynis audit
echo "Installing Lynis (if not installed)..."
sudo apt update
sudo apt install -y lynis

echo "Running Lynis system audit..."
sudo lynis audit system | tee lynis-report.txt

echo "Lynis audit complete. Report saved to lynis-report.txt"
