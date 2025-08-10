#!/bin/bash

set -e

echo "[*] Mulai update semua tools (root required)"
if [[ $EUID -ne 0 ]]; then
   echo "[-] Harus dijalankan sebagai root (sudo)" 
   exit 1
fi

# Update system packages
apt update
apt upgrade -y

# Update all git repos under /opt
for dir in /opt/*; do
  if [ -d "$dir/.git" ]; then
    echo "[*] Updating git repo $dir"
    git -C "$dir" pull
  fi
done

# Update pip global packages
pip3 list --outdated --format=freeze | cut -d = -f 1 | xargs -r pip3 install -U

echo "[*] Semua tools sudah diperbarui."
