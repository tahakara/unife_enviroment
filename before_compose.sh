#!/bin/bash

set -e

echo "[INFO] Checking Tailscale installation..."
if ! command -v tailscale &> /dev/null; then
    echo "[INFO] Tailscale not found, starting installation."
    curl -fsSL https://tailscale.com/install.sh | sh
else
    echo "[INFO] Tailscale is already installed."
fi

echo "[INFO] Checking Docker installation..."
if ! command -v docker &> /dev/null; then
    echo "[INFO] Docker not found, starting installation."
    curl -fsSL https://get.docker.com | sh
else
    echo "[INFO] Docker is already installed."
fi

echo "[INFO] Restarting Tailscale service..."
sudo systemctl restart tailscaled || sudo service tailscaled restart

echo "[INFO] Restarting Docker service..."
sudo systemctl restart docker || sudo service docker restart

echo "[INFO] Installation and restart operations completed."

echo "[INFO] Rebooting the machine in 5 seconds... Press Ctrl+C to cancel."
sleep 5
sudo reboot
