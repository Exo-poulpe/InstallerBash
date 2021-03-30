#!/bin/bash
# Run in sudo mode
# Date          : 2020/09/20
# Author        : Exo-poulpe
# Description   : Bash script for install tools on linux 

declare userValue

if [ `id -u` -ne 0 ];then
echo "Please run this script in root"
exit
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ];then
echo "Script to install tools"
echo "argument 1 for Desk"
echo "argument 2 for Security"
echo "no argument foir interact mode"
exit 
fi

echo "Start install"

apt update
apt dist-upgrade -y

# Install base
echo "Base install"
apt install -y python3-pip
pip3 install ueberzug
apt install -y nmap
apt install -y vlc
apt install -y git
apt install -y htop
apt install -y vim
apt install -y neovim
apt install -y redshift
apt install -x qbittorrent
apt install -y wget
apt install -y gufw
apt install -y qcalc
apt install -y cfdisk
apt install -y firefox-esr
apt install -y vscodium
apt install -y atril
apt install -y ssh
apt install -y sshfs
apt install -y pyp
apt install -y curl
apt install -y ranger
apt install -y mc
apt install -y cmus
apt install -y lynx
apt install -y lynis
apt install -y libmtp-common gvfs-backends gvfs-fuse

# Fun
# https://github.com/bartobri/no-more-secrets
# https://github.com/GitSquared/edex-ui


if [ $1 -z ];then
echo "Which install you want ?"
echo "1) Desk"
echo "2) Security"
read -p "Choose mode : " userValue
fi

# Check if argument is for Desk
if [ "$1" == "1" ] || [ "$userValue" == "1" ];then
echo "Desk install"
apt install -y libreoffice-common
apt install -y texstudio
apt install -y texlive-lang-french
apt install -y xournalpp
apt install -y mdp
fi

# Check if argument is for Security
if [ "$1" == "2" ] || [ "$userValue" == "2" ];then
echo "Security install"
apt install -y netcat
apt install -y hashcat
apt install -y john
apt install -y hydra
apt install -y metasploit-framework
apt install -y hashid
apt install -y sqlmap
apt install -y crunch
apt install -y nmap


wget https://github.com/zaproxy/zaproxy/releases/download/v2.9.0/ZAP_2_9_0.sh
bash ZAP_2_9_0.sh
rm ZAP_2_9_0.sh

mkdir MaskBinary
cd MaskBinary
wget "https://github.com/hashcat/maskprocessor/releases/download/v0.73/maskprocessor-0.73.7z"
7z e maskprocessor*.7z -oTmp -r
cd Tmp
rm *.exe
cd ..
cd ..
fi

ranger --copy-config=all
echo "Install finish"
echo "Edit .config/ranger/rc.conf 'set preview image true' 'set preview_image_method ueberzug'"


