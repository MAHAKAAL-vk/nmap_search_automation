#!/bin/bash

echo "Welcome to VK's Reconnaissance through IP/Domain Scanner Tool"

read -p "Enter the target IP or domain: " target
filename="Results/${target}_scan.txt"
mkdir -p Results

echo "Scanning host: $target"
echo "Results will be saved in $filename"

# Ping Scan

echo "Running Ping Scan...\n" | tee -a $filename
nmap -sn -PO $target | tee -a $filename

# Port Scan

echo -e "\n\nRunning Port Scan...\n" | tee -a $filename
nmap -sV -r -p- $target | tee -a $filename

# OS Detection

echo -e "\n\nRunning OS Detection and Service Version Scan...\n" | tee -a $filename
nmap -A -sV -O $target | tee -a $filename

echo -e "\nScan completed. Check the file: $filename"
