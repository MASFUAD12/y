#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }


# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

clear
domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "${BIBlue}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIBlue}│              CREATE TROJAN ACCOUNT              │${NC}"
echo -e "${BIBlue}└─────────────────────────────────────────────────┘${NC}"
read -p "Username         : " user
read -p "Quota (GB)       : " quota
read -p "Max Ip login     : " iplimit
read -p "Masaaktif        : " masaaktif
#QUOTA
if [[ $quota -gt 0 ]]; then
echo -e "$[$quota * 1024 * 1024 * 1024]" > /etc/cobek/limit/trojan/quota/$user
else
echo > /dev/null
fi

#IPLIMIT
if [[ $iplimit -gt 0 ]]; then
echo -e "$iplimit" > /etc/cobek/limit/trojan/ip/$user
else
echo > /dev/null
fi

		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
		
		if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "${BIBlue}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIBlue}│              CREATE TROJAN ACCOUNT              │${NC}"
echo -e "${BIBlue}└─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			trojan-menu
		fi
	done
echo -e "MASUKKAN UUID/KOSONGKAN UNTUK MENDAPATKAN UUID OTOMATIS"
echo -e ""
read -p "UUID/PASSWORD : " uuid
if [[ $uuid == "" ]]; then
uuid=$(cat /proc/sys/kernel/random/uuid)
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
clear
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BIBlue}   🐉 TROJAN ACCOUNT 🐉      ${NC}"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                  
echo -e ""                
echo -e "🧿 Username     : $user"
echo -e "🧿 Host/IP      : ${domain}" 
echo -e "🧿 Port         : 443" 
echo -e "🧿 Key          : ${uuid}" 
echo -e "🧿 Path         : /trojan-ws"
echo -e "🧿 ServiceName  : trojan-grpc" 
echo -e ""  
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                
echo -e "🧿 Link Ws  => ${trojanlink}"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                 
echo -e "🧿 Link Grpc => ${trojanlink1}"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                
echo -e "🧿 Expired => $exp"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" 
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
