#!/bin/bash
# ═══════════════════════════════════════════════════════════════════
# (C) Copyright 2023 Oleh Tekiro & cobekXvA
# ═══════════════════════════════════════════════════════════════════
# Nama        : AutoScript VPN
# Info          : Rungkad
# Dibuat Pada : 07-12-2023 ( ........ )
# OS Support  : Ubuntu & Debian
# Owner       : Tekiro & cobekXvA
# Telegram    : https://t.me/LynzINFO
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
TIME="10"
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEY/sendMessage"
function BACKUPVPS() {
    rm -rf /root/backup
    mkdir /root/backup
    cp /etc/passwd backup/
    cp /etc/group backup/
    cp /etc/shadow backup/
    cp /etc/gshadow backup/
    cp /etc/crontab backup/
    cp -r /var/lib/cobek/ backup/cobek 
    cp -r /etc/xray backup/xray
    cp -r /var/www/html/ backup/html
    cp /etc/ssh/.ssh.db backup/
    cp /etc/vmess/.vmess.db backup/
    cp /etc/vless/.vless.db backup/
    cp /etc/trojan/.trojan.db backup/
    cp /etc/shadowsocks/.shadowsocks.db backup/
    cd /root
    zip -r $IP-$DATEVPS.zip backup > /dev/null 2>&1
    rclone copy /root/$IP-$DATEVPS.zip dr:backup/
    url=$(rclone link dr:backup/$IP-$DATEVPS.zip)
    id=(`echo $url | grep '^https' | cut -d'=' -f2`)
    link="https://drive.google.com/u/4/uc?id=${id}&export=download"
    rm -rf backup
    rm -rf $IP-$DATEVPS.zip
echo -e "
${blue}_______________________________________${NC}
${BGX}      SUCCESSFULL BACKUP YOUR VPS      ${NC}
${BGX}     Please Save The Following Data    ${NC}
${blue}_______________________________________${NC}
${putih}YOUR VPS IP : $IP${NC}
${putih}DOMAIN      : $HOST${NC}
${putih}DATE        : $DATEVPS${NC}
${putih}LINK BACKUP : $link${NC}
${blue}_______________________________________${NC}
"
echo -e ""
TEXT="
<code>_______________________________________</code>
<code>  SUCCESSFULL BACKUP YOUR VPS</code>
<code> Please Save The Following Data</code>
<code>_______________________________________</code>
<code>YOUR VPS IP :</code> <code>$IP</code>
<code>DOMAIN      :</code> <code>$HOST</code>
<code>DATE        :</code> <code>$DATEVPS</code>
<code>LINK BACKUP :</code>$link
<code>_______________________________________</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
BACKUPVPS