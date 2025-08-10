#!/bin/bash

set -e

echo "[*] Mulai instalasi tools di Ubuntu 24.04.3 (root required)"
if [[ $EUID -ne 0 ]]; then
   echo "[-] Harus dijalankan sebagai root (sudo)" 
   exit 1
fi

apt update
apt install -y git python3 python3-pip python3-venv curl wget ruby golang-go \
  nmap hydra nikto sqlmap john aircrack-ng wireshark \
  dirbuster httrack zenmap openssl sslscan sslsplit sslh openjdk-17-jre amap wapiti

# Beberapa tools sudah tersedia di apt
echo "[*] Tools via apt sudah diinstall"

# Beef-xss
if [ ! -d /opt/beef ]; then
  git clone https://github.com/beefproject/beef.git /opt/beef
  cd /opt/beef
  ./install
  cd -
else
  echo "[*] Beef-xss sudah terinstall"
fi

# Exploitdb
if [ ! -d /opt/exploitdb ]; then
  git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
  ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
else
  echo "[*] Exploitdb sudah terinstall"
fi

# h8mail via pip user (root disarankan instal global)
pip3 install h8mail

# ParamSpider
if [ ! -d /opt/paramspider ]; then
  git clone https://github.com/devanshbatham/ParamSpider.git /opt/paramspider
  pip3 install -r /opt/paramspider/requirements.txt
else
  echo "[*] ParamSpider sudah terinstall"
fi

# Hakrawler via go install
if ! command -v hakrawler &> /dev/null; then
  sudo -u $(logname) env PATH=$PATH go install github.com/hakluke/hakrawler@latest
else
  echo "[*] Hakrawler sudah terinstall"
fi

# Spiderfoot via pip
pip3 install spiderfoot

# Waybackpy via pip
pip3 install waybackpy

# Eyewitness
if [ ! -d /opt/eyewitness ]; then
  git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/eyewitness
else
  echo "[*] Eyewitness sudah terinstall"
fi

# Getsploit
if [ ! -d /opt/getsploit ]; then
  git clone https://github.com/1N3/getsploit.git /opt/getsploit
else
  echo "[*] Getsploit sudah terinstall"
fi

# Metagoofil
if [ ! -d /opt/metagoofil ]; then
  git clone https://github.com/laramies/metagoofil.git /opt/metagoofil
  pip3 install -r /opt/metagoofil/requirements.txt
else
  echo "[*] Metagoofil sudah terinstall"
fi

# ReconSpider via pip
pip3 install reconspider

# Raccoon Scanner
if [ ! -d /opt/raccoon-scanner ]; then
  git clone https://github.com/evyatarmeged/RaccoonScanner.git /opt/raccoon-scanner
else
  echo "[*] Raccoon Scanner sudah terinstall"
fi

# Sn0int via pip
pip3 install sn0int

# Email2phonenumber via pip
pip3 install email2phonenumber

# O-saft
if [ ! -d /opt/o-saft ]; then
  git clone https://github.com/purplefox121/OSAFT.git /opt/o-saft
  pip3 install -r /opt/o-saft/requirements.txt
else
  echo "[*] O-saft sudah terinstall"
fi

# Tambah ~/.local/bin ke PATH di /etc/profile (global)
if ! grep -q '~/.local/bin' /etc/profile; then
  echo 'export PATH=$PATH:~/.local/bin' >> /etc/profile
fi

echo "[*] Instalasi tools selesai."
