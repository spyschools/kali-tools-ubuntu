#!/bin/bash

set -e

echo "[*] Memulai update semua tools..."

sudo apt update
sudo apt upgrade -y

# Update exploitdb
if [ -d /opt/exploitdb ]; then
  sudo git -C /opt/exploitdb pull
fi

# Update exploitdb-papers
if [ -d /opt/exploitdb-papers ]; then
  sudo git -C /opt/exploitdb-papers pull
fi

# Update beef-xss
if [ -d /opt/beef ]; then
  sudo git -C /opt/beef pull
fi

# Update paramspider
if [ -d /opt/paramspider ]; then
  sudo git -C /opt/paramspider pull
fi

# Update eyewitness
if [ -d /opt/eyewitness ]; then
  sudo git -C /opt/eyewitness pull
fi

# Update getsploit
if [ -d /opt/getsploit ]; then
  sudo git -C /opt/getsploit pull
fi

# Update metagoofil
if [ -d /opt/metagoofil ]; then
  sudo git -C /opt/metagoofil pull
fi

# Update raccoon-scanner
if [ -d /opt/raccoon-scanner ]; then
  sudo git -C /opt/raccoon-scanner pull
fi

# Update pip packages (root)
sudo pip3 install --upgrade h8mail spiderfoot waybackpy reconspider sn0int email2phonenumber

echo "[*] Update selesai."

