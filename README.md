Linux System Audit & Hardening Project
Overview
This project demonstrates a comprehensive audit and hardening process of a Linux system using built-in commands and the open-source tool Lynis. It includes user/group management, file permission verification, privilege escalation security, and recommendations to improve system security posture.
Learning Objectives
Verify and correct permissions on critical system files.


Create and manage Linux users and groups securely.


Assign and confirm sudo privileges.


Run a Lynis system audit to identify vulnerabilities.


Interpret audit output and apply system hardening recommendations.


Steps Performed
Step 1: Check & Fix File Permissions
Checked permissions on:
/etc/shadow, /etc/gshadow: -rw-------


/etc/passwd, /etc/group: -rw-r--r--


Used chmod to adjust if needed.

Step 2: Add Users to the System
Created users:
 sam, joe, amy, sara, admin1
Command used:
bash
CopyEdit
sudo useradd <username>

Step 3: Grant sudo Access to admin1
Added admin1 to the sudo group:
bash
CopyEdit
sudo usermod -aG sudo admin1

Verified with:
bash
CopyEdit
groups admin1

Step 4: Create Group & Assign Users
Created the engineers group and added users:
bash
CopyEdit
sudo groupadd engineers
sudo usermod -aG engineers sam
sudo usermod -aG engineers joe
sudo usermod -aG engineers amy
sudo usermod -aG engineers sara
sudo usermod -aG engineers admin1

Verified with:
bash
CopyEdit
getent group engineers


Step 5: Run Lynis Security Audit
Ran the audit:
bash
CopyEdit
sudo lynis audit system

Saved results:
bash
CopyEdit
sudo cp /var/log/lynis-report.dat ~/Desktop/lynis-report.txt

Audit Summary (Lynis)
Key findings included:
Weak or default file permissions.


No password aging policies.


Logging services could be improved.


Root login via SSH not disabled.


No file integrity monitoring tool installed.


Hardening Recommendations
Set password expiration with chage.


Install AIDE or a similar file integrity tool.


Harden SSH by disabling root login.


Enable and configure system logging (rsyslog).


Keep software packages and kernel updated.


Use ufw or iptables to restrict inbound traffic.



Files Included
lynis-report.txt: Full Lynis audit output.


README.md: Project summary (this file).
Linux System Hardening.pdf
