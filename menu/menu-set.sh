#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
GBlue='\033[1;44m'
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

clear
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${GBlue}                  MENU SETTINGS                  ${NC}" 
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${BIBlue}┌───────────────────────────────────────────────┐${NC}" 
echo -e "   ${BIYellow}[${BIGreen}01${BIYellow}]${BICyan} ADD Host/Domain${NC}"
echo -e "   ${BIYellow}[${BIGreen}02${BIYellow}]${BICyan} Renew CertXRAY${NC}"
echo -e "   ${BIYellow}[${BIGreen}03${BIYellow}]${BICyan} Check Running${NC}"
echo -e "   ${BIYellow}[${BIGreen}04${BIYellow}]${BICyan} Change Banner SSH${NC} "
echo -e "   ${BIYellow}[${BIGreen}05${BIYellow}]${BICyan} Info-Bandwidth${NC}"
echo -e "   ${BIYellow}[${BIGreen}06${BIYellow}]${BICyan} Restart${NC}"
echo -e "   ${BIYellow}[${BIGreen}07${BIYellow}]${BICyan} Auto Reboot${NC}"
echo -e "   ${BIYellow}[${BIGreen}08${BIYellow}]${BICyan} Reboot${NC}"
echo -e "   ${BIYellow}[${BIGreen}09${BIYellow}]${BICyan} SpeedTest${NC}"
echo -e "   ${BIYellow}[${BIGreen}10${BIYellow}]${BICyan} Limit Speed${NC}"
echo -e "   ${BIYellow}[${BIGreen}11${BIYellow}]${BICyan} Webmin${NC}"
echo -e "   ${BIYellow}[${BIGreen}12${BIYellow}]${BICyan} Update Script${NC}"
echo -e "   ${BIYellow}[${BIGreen}13${BIYellow}]${BICyan} Tendang User Mullog${NC}"
echo -e "   ${BIYellow}[${BIGreen}14${BIYellow}]${BICyan} About SCRIPT${NC}"
echo -e ""
echo -e "   ${BIYellow}[${BIGreen}0${BIYellow}]${BICyan}  Back To Menu${NC}"
echo -e "   ${BIYellow}[${BIGreen}x${BIYellow}]${BICyan}  Exit${NC}"
echo -e " ${BIBlue}└───────────────────────────────────────────────┘${NC}" 
echo -e ""
read -p "  Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; addhost ;;
02 | 2) clear ; certxray ;;
03 | 3) clear ; running ;;
04 | 4) clear ; nano /etc/issue.net ;;
05 | 5) clear ; cek-bandwidth ;;
06 | 6) clear ; restart ;;
07 | 7) clear ; autoreboot ;;
08 | 8) clear ; reboot ;;
09 | 9) clear ; speedtest ;;
10 | 10) clear ; limitspeed ;;
11 | 11) clear ; webmin ;;
12 | 12) clear ; update ;;
13 | 13) clear ; tendang ;;
14 | 14) clear ; about ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) clear ; menu-set ;;
esac
