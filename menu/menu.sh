#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[0;94m'       # Blue
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
GBlue='\033[0;44m'
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
echo -e " ${IBlue}┌─────────────────────────────────────────────────────┐$NC" 
echo -e " ${IBlue}│${GBlue}                     DEGAN TUNNEL                    ${IBlue}│$NC" 
echo -e " ${IBlue}└─────────────────────────────────────────────────────┘$NC"
echo -e " ${IBlue}┌─────────────────────────────────────────────────────┐$NC"
echo -e "   ${BIYellow}System Uptime     :  ${ICyan}$SERONLINE ${NC}"
echo -e "   ${BIYellow}OS VPS            :  "${ICyan}`hostnamectl | grep "Operating System" | cut -d ' ' -f5-` $NC
echo -e "   ${BIYellow}Memory Usage      :  ${ICyan}$uram MB/ $tram MB${NC}"
echo -e "   ${BIYellow}CPU Usage         :  ${ICyan}$cpu_usage ${NC}"
echo -e "   ${BIYellow}Domain            :  ${ICyan}$(cat /etc/xray/domain)${NC}"
echo -e "   ${BIYellow}IP VPS            :  ${ICyan}$IPVPS${NC}"
echo -e "   ${BIYellow}ISP VPS           :  ${ICyan}$ISPVPS${NC}"
echo -e "   ${BIYellow}REGION            :  ${ICyan}$(curl -s ipinfo.io/timezone )${NC}"
echo -e "   ${BIYellow}DATE&TIME         :  ${ICyan}$( date -d "0 days" +"%d-%m-%Y | %X" ) ${NC}"
echo -e " ${IBlue}└─────────────────────────────────────────────────────┘$NC"
echo -e " ${IBlue}┌─────────────────────────────────────────────────────┐$NC"
echo -e "   ${BIYellow} SSH$NC     ${BIYellow} VMESS$NC     ${BIYellow} VLESS$NC     ${BIYellow} TROJAN$NC     ${BIYellow} SHADOW  $NC${Blue}$NC"
echo -e "     $ssh1" "        $vma" "         $vla" "          $trb" "         $ssa" "        $NC${Blue}$NC"
echo -e " ${IBlue}└─────────────────────────────────────────────────────┘$NC"
echo -e " ${IBlue}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "  ${BIYellow} SSH ${NC}: $ressh"" ${BIYellow} NGINX ${NC}: $resngx"" ${BIYellow}  XRAY ${NC}: $resv2r"" ${BIYellow} TROJAN ${NC}: $resv2r"
echo -e "     ${BIYellow}         DROPBEAR ${NC}: $resdbr" "${BIYellow} SSH-WS ${NC}: $ressshws"            
echo -e " ${IBlue}└─────────────────────────────────────────────────────┘$NC"
echo -e " ${IBlue}┌─────────────────────────────────────────────────────┐$NC"
echo -e "     ${BICyan}[${BIYellow}1${BICyan}]${BIYellow} MENU SSH${NC}                  ${BICyan}[${BIYellow}6${BICyan}]${BIYellow} SETTING${NC}" 
echo -e "     ${BICyan}[${BIYellow}2${BICyan}]${BIYellow} MENU VMESS${NC}                ${BICyan}[${BIYellow}7${BICyan}]${BIYellow} BACKUP/RESTORE${NC}"    
echo -e "     ${BICyan}[${BIYellow}3${BICyan}]${BIYellow} MENU VLESS${NC}                ${BICyan}[${BIYellow}8${BICyan}]${BIYellow} INFO-SCRIPT${NC}"    
echo -e "     ${BICyan}[${BIYellow}4${BICyan}]${BIYellow} MENU TROJAN${NC}               ${BICyan}[${BIYellow}9${BICyan}]${BIYellow} INFO-SERVER${NC}" 
echo -e "     ${BICyan}[${BIYellow}5${BICyan}]${BIYellow} SHADOWSOCKS${NC}               ${BICyan}[${BIYellow}x${BICyan}]${BIYellow} EXIT MAIN MENU${NC}"     
echo -e " ${IBlue}└─────────────────────────────────────────────────────┘$NC"
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
6) clear ; menu-set ;;
7) clear ; menu-backup ;;
8) clear ; info ;;
9) clear ; infoserv ;;
99) clear ; update ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
