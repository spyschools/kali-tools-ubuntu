#!/bin/bash

set -e

echo "[*] Mulai instalasi semua tools dengan hak akses root..."

# Update dan install dependencies dasar
sudo apt update
sudo apt install -y git python3 python3-pip python3-venv curl wget ruby golang-go openjdk-17-jre \
  nmap hydra nikto sqlmap john aircrack-ng wireshark dirbuster httrack zenmap openssh-client openssl \
  sslscan sslsplit sslh amap armitage wapiti seclists set

# Install beef-xss
if [ ! -d /opt/beef ]; then
  sudo git clone https://github.com/beefproject/beef.git /opt/beef
  cd /opt/beef
  sudo ./install
else
  echo "[*] beef-xss sudah terinstall di /opt/beef."
fi

# Install exploitdb
if [ ! -d /opt/exploitdb ]; then
  sudo git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
  sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
fi

# Install h8mail via pip (root)
sudo pip3 install h8mail

# Install paramspider
if [ ! -d /opt/paramspider ]; then
  sudo git clone https://github.com/devanshbatham/ParamSpider.git /opt/paramspider
  sudo pip3 install -r /opt/paramspider/requirements.txt
fi

# Install hakrawler
sudo -H -u $(logname) bash -c "go install github.com/hakluke/hakrawler@latest"

# Install spiderfoot
sudo pip3 install spiderfoot

# Install waybackpy
sudo pip3 install waybackpy

# Install eyewitness
if [ ! -d /opt/eyewitness ]; then
  sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/eyewitness
fi

# Install getsploit
if [ ! -d /opt/getsploit ]; then
  sudo git clone https://github.com/1N3/getsploit.git /opt/getsploit
fi

# Install metagoofil
if [ ! -d /opt/metagoofil ]; then
  sudo git clone https://github.com/laramies/metagoofil.git /opt/metagoofil
  sudo pip3 install -r /opt/metagoofil/requirements.txt
fi

# Install reconspider
sudo pip3 install reconspider

# Install raccoon-scanner
if [ ! -d /opt/raccoon-scanner ]; then
  sudo git clone https://github.com/evyatarmeged/RaccoonScanner.git /opt/raccoon-scanner
fi

# Install sn0int
sudo pip3 install sn0int

# Install email2phonenumber
sudo pip3 install email2phonenumber

# Install o-saft
if [ ! -d /opt/o-saft ]; then
  sudo git clone https://github.com/purplefox121/OSAFT.git /opt/o-saft
  sudo pip3 install -r /opt/o-saft/requirements.txt
fi

echo "[*] Instalasi selesai. Pastikan PATH ~/.local/bin sudah ada jika pakai pip user."

