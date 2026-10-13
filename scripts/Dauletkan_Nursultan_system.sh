#!/bin/bash
# System information script - Dauletkan Nursultan, IT2-2313, ID 37037

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Dauletkan_Nursultan_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Nursultan"
echo "Surname: Dauletkan"
echo "Group: IT2-2313"
echo "Student ID: 37037"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date '+%Y-%m-%d %H:%M:%S')"
if [ -f /etc/os-release ]; then
    OS_NAME=$(. /etc/os-release && echo "$PRETTY_NAME")
else
    OS_NAME=$(uname -s)
fi
echo "Operating System: $OS_NAME ($(uname -s) $(uname -r))"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
if command -v free >/dev/null 2>&1; then
    echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
else
    echo "Memory Usage: 'free' command not available"
fi
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
