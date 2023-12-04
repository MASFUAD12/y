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

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

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
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
#uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
#upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
#uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
#cekup=`uptime -p | grep -ow "day"`
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )

clear
echo -e " ┌─────────────────────────────────────────────────────┐" 
echo -e " │                   BLUEBERRY TUNNEL                  │" 
echo -e " └─────────────────────────────────────────────────────┘" 
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│  ${BIBlue}System Uptime     :  ${BIBlue}$SERONLINE ${NC}"
echo -e " ${BICyan}│  ${BIBlue}OS VPS            :  "${BIBlue}`hostnamectl | grep "Operating System" | cut -d ' ' -f5-` $NC
echo -e " ${BICyan}│  ${BIBlue}Memory Usage      :  ${BIBlue}$uram MB/ $tram MB${NC}"
echo -e " ${BICyan}│  ${BIBlue}CPU Usage         :  ${BIBlue}$cpu_usage ${NC}"
echo -e " ${BICyan}│  ${BIBlue}Domain            :  ${BIBlue}$(cat /etc/xray/domain)${NC}"
echo -e " ${BICyan}│  ${BIBlue}IP VPS            :  ${BIBlue}$IPVPS${NC}"
echo -e " ${BICyan}│  ${BIBlue}ISP VPS           :  ${BIBlue}$ISPVPS${NC}"
echo -e " ${BICyan}│  ${BIBlue}REGION            :  ${BIBlue}$(curl -s ipinfo.io/timezone )${NC}"
echo -e " ${BICyan}│  ${BIBlue}DATE&TIME         :  ${BIBlue}$( date -d "0 days" +"%d-%m-%Y | %X" ) ${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────────┐" 
echo -e " ${Blue}│${NC} $y SSH$NC     $y VMESS$NC     $y VLESS$NC     $y TROJAN$NC     $y SHADOW  $NC${Blue}│$NC"
echo -e " ${Blue}│${NC}   $ssh1" "        $vma" "         $vla" "          $trb" "         $ssa" "        $NC${Blue}│$NC"
echo -e " └─────────────────────────────────────────────────────┘" 
echo -e " ┌─────────────────────────────────────────────────────┐" 
echo -e " │ ${BIBlue} SSH ${NC}: $ressh"" ${BIBlue} NGINX ${NC}: $resngx"" ${BIBlue}  XRAY ${NC}: $resv2r"" ${BIBlue} TROJAN ${NC}: $resv2r  │"
echo -e " │    ${BIBlue}         DROPBEAR ${NC}: $resdbr" "${BIBlue} SSH-WS ${NC}: $ressshws            │"
echo -e " └─────────────────────────────────────────────────────┘" 
echo -e " ┌─────────────────────────────────────────────────────┐" 
echo -e "     ${BICyan}[${BIBlue}1${BICyan}]${BIBlue} MENU SSH${NC}                  ${BICyan}[${BIBlue}6${BICyan}]${BIBlue} BACKUP/RESTORE${NC}" 
echo -e "     ${BICyan}[${BIBlue}2${BICyan}]${BIBlue} MENU VMESS${NC}                ${BICyan}[${BIBlue}7${BICyan}]${BIBlue} SETTINGS${NC}"    
echo -e "     ${BICyan}[${BIBlue}3${BICyan}]${BIBlue} MENU VLESS${NC}                ${BICyan}[${BIBlue}8${BICyan}]${BIBlue} INFO-SCRIPT${NC}"    
echo -e "     ${BICyan}[${BIBlue}4${BICyan}]${BIBlue} MENU TROJAN${NC}               ${BICyan}[${BIBlue}9${BICyan}]${BIBlue} INFO-SERVER${NC}" 
echo -e "     ${BICyan}[${BIBlue}5${BICyan}]${BIBlue} SHADOWSOCKS${NC}               ${BICyan}[${BIBlue}x${BICyan}]${BIBlue} EXIT MAIN MENU${NC}"     
echo -e " └─────────────────────────────────────────────────────┘" 
#echo -e "      ┌──────────────────────────────────────────┐" 
echo -e "        ${p}▁ ${Blue}▂ ${cy}▃ ${Lgreen}▄ ${y}▅ ${r}▆ ${RED}█$NC ${y}KEEP MUMETS$NC ${RED}█$NC ${r}▆ ${y}▅ ${Lgreen}▄ ${cy}▃ ${Blue}▂ ${p}▁$NC"
#echo -e "      └──────────────────────────────────────────┘" 
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ss ;;
6) clear ; menu-backup ;;
7) clear ; menu-set ;;
8) clear ; info ;;
9) clear ; infoserv ;;
99) clear ; update ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
