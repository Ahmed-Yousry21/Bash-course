#!/bin/bash

# Get the IP address that starts with 192
IP_ADDR=$(ip addr | grep -oP '192\.\d+\.\d+\.\d+')

read -p 'Do You want to change the IP? [y/n]: ' INPUT
INPUT=$(echo "$INPUT" | tr '[:upper:]' '[:lower:]')

if [ "$INPUT" = "y" ]; then
    read -p 'Network interface (e.g., enp0s8): ' NETWORKIF
    read -p 'New IP: ' NIP
    input_file="/etc/sysconfig/network-scripts/ifcfg-$NETWORKIF"

    # Display the current configuration file
    if sudo cat "$input_file"; then
        echo "Displaying the current configuration for $NETWORKIF"
    else
        echo "Failed to read the configuration file. Ensure you have the correct permissions."
        exit 1
    fi
else
    echo "Your IP address is: $IP_ADDR"
    exit 0
fi

# Change the IP address
if [ "$INPUT" = "y" ]; then
    if [ ! -f "$input_file" ]; then
        echo "Input file does not exist."
        exit 1
    fi

    sudo sed -i '/^IPADDR/d' "$input_file"
    echo "IPADDR=$NIP" | sudo tee -a "$input_file"
    sudo systemctl restart network

    echo "Updated IP-ADDR in $input_file to $NIP"
fi
