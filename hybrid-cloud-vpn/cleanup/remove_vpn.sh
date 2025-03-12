#!/bin/bash

# Stop OpenVPN service
sudo systemctl stop openvpn-server@server
sudo systemctl disable openvpn-server@server

# Remove OpenVPN configuration and keys
sudo rm -rf /etc/openvpn
sudo rm -rf /var/log/openvpn

# Uninstall OpenVPN and dependencies
sudo yum remove -y openvpn easy-rsa

# Remove firewall rules
sudo nft delete table ip nat

# Restart network services
sudo systemctl restart network

echo "OpenVPN has been successfully removed."