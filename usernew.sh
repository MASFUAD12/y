#!/bin/bash
#CRSe7en2nd

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
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=$(cat /etc/xray/domain)
else
domen=$(cat /etc/v2ray/domain)
fi
portsshws="$(cat /root/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}')"
wsssl="$(cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}')"

echo -e "${BIBlue}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIBlue}│               CREATE SSH ACCOUNT                │${NC}"
echo -e "${BIBlue}└─────────────────────────────────────────────────┘${NC}"
read -p "Username       : " Login
read -p "Password       : " Pass
read -p "Max IP         : " iplimit
read -p "Expired (Days) : " masaaktif

IP=$(curl -sS ifconfig.me);
domain=$(cat /etc/xray/domain);
ossl="$(cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}')"
opensh="$(cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}')"
db="$(cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}')"
ssl="$(cat /root/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat /root/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH="$(cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}')"
OhpDB="$(cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}')"
OhpOVPN="$(cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}')"

sleep 1
#limitip
if [[ $iplimit -gt 0 ]]; then
echo -e "$iplimit" > /etc/cobek/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "${BIBlue}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIBlue}│                   SSH ACCOUNT                   │${NC}"
echo -e "${BIBlue}└─────────────────────────────────────────────────┘${NC}"                
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 53, 5300"
echo -e "Udp Custom   : 1-65535"
echo -e "Port ssl/tls : 443, 441, 445, 777"
echo -e "Port non tls : 8880, 109, 143, 80"   
echo -e "OpenSSH      : 22"
echo -e "Dropbear     : 109, 143" 
echo -e "SSH-WS       : 80" 
echo -e "SSH WS SSL   : 443" 
echo -e "SSL/TLS      : 447, 777"         
echo -e "OVPN TCP     : http://$domain:89/tcp.ovpn"
echo -e "OVPN UDP     : http://$domain:89/udp.ovpn"
echo -e "BadVpn       : 7100-7300"      
echo -e ""  
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Payload WS"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Payload WSS"
echo -e "GET wss://[host] HTTP/1.1[crlf]Host: bug.com[crlf]Connection: Arz-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""  
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"              
echo -e "      Expired => $exp"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""  
echo -e "${BIBlue}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIBlue}│                  MAS FUAD                    │${NC}"
echo -e "${BIBlue}└─────────────────────────────────────────────────┘${NC}"
            
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
