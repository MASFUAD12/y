#!/bin/bash
# ═══════════════════════════════════════════════════════════════════
# (C) Copyright 2023 Oleh Tekiro & cobekXvA
# ═══════════════════════════════════════════════════════════════════
# Nama        : AutoScript VPN
# Info          : Rungkad
# Dibuat Pada : 07-12-2023 ( ........ )
# OS Support  : Ubuntu & Debian
# Owner       : Tekiro & cobekXvA
# Telegram    : https://t.me/cobekINFO
# Github       : github.com/Ryuchiii
# ═══════════════════════════════════════════════════════════════════

IP=$(curl -s ipv4.icanhazip.com)
HOST="$(cat /etc/xray/domain)"
DATEVPS=$(date +"%d-%B-%Y")
ISPVPS=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)

# ═══════════════
# // Allow Access
# ═══════════════
clear
echo "Silahkan Masukin Link Backupnya"
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r cobek /var/lib/
cp -r xray /etc/
cp -r html /var/www/
cp crontab /etc/
cp .ssh.db /etc/ssh/
cp .vmess.db /etc/vmess/
cp .vless.db /etc/vless/
cp .trojan.db /etc/trojan/
cp .shadowsocks.db /etc/shadowsocks/
echo -e "
${blue}_______________________________________${NC}
${BGX}      SUCCESSFULL RESTORE YOUR VPS     ${NC}
${BGX}     Please Save The Following Data    ${NC}
${blue}_______________________________________${NC}
${putih}YOUR VPS IP : $IP${NC}
${putih}DOMAIN      : $HOST${NC}
${putih}DATE        : $DATEVPS${NC}
${blue}_______________________________________${NC}
"
rm -rf /root/backup
rm -f backup.zip
echo ""