#!/usr/bin/env bash
#=============================================================
# https://github.com/roshanconnor123/Gdutils_Tgbot
# File Name: install.sh
# Author: roshanconnor
# Description:一Installation of Gdutils Telegram Bot
# System Required: Debian/Ubuntu
#=============================================================

COLOR="\033["
NORMAL="${COLOR}0m"
YELLOW="${COLOR}1;33m"
RED="${COLOR}1;31m"
CYAN="${COLOR}1;36m"
BLUE="${COLOR}1;34m"
GREEN="${COLOR}1;32m"
PURPLE="${COLOR}1;35m"

# ★★★Installation of Dependancies and Gdutils★★★
gdutils() {
  cd ~
  sudo apt-get install build-essential
  sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install wget git curl tree unzip vim nano sudo
  sudo apt-get install nginx
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && sudo apt-get install -y nodejs && sudo apt-get install npm && sudo apt-get install gcc g++ make
  npm install dayjs --save  
  cd ~/Gdutils_Tgbot
  npm install --unsafe-perm=true --allow-root
  echo "${BLUE}Gdutils has been Installed succesfully${NORMAL}" && exit
}
# ★★★Downloading Service Accounts from github★★★
sa() {
  cd ~
  echo "Downloading Service accounts from your private repo" 
  echo "Provide github username\n"
  read username
  echo "Provide github password\n"
  read Password
  cd ~
  git clone https://"$username":"$Password"@github.com/"$username"/accounts
  cp accounts/*.json Gdutils_Tgbot/sa/
  echo "${BLUE}Service accounts are added to Gdutils${NORMAL}" && exit
}  
# ★★★Running Gdutils server★★★  
server() {
  echo "Make Sure that You added Bot Token and Telegram Username to config.js"
  cd ~/Gdutils_Tgbot
  sudo npm i pm2 -g
  sudo pm2 start server.js --node-args="--max-old-space-size=512"
  echo "${BLUE}Gdutils succesfully configured${NORMAL}" && exit
}
# ★★★Configuring Nginx★★★
nginx() {
  cd /etc/nginx/sites-enabled/
  sudo nano a
  sudo rm default
  sudo nginx -t
  sudo nginx -s reload
  echo "${BLUE}Nginx Succesfully Configured${NORMAL}" && exit
}
# ★★★Running the bot★★★ 
bot() {
  echo "Please Provide your website address\n"
  read website
  echo "Please Provide your Bot Token\n"
  read token
  curl '"$website"/api/gdurl/count?fid=124pjM5LggSuwI1n40bcD5tQ13wS0M6wg'
  curl -F "url="$website"/api/gdurl/tgbot" 'https://api.telegram.org/bot"$token"/setWebhook'
  echo -e "${BLUE}Your Telegram Bot is Up and running..Type /help in Bot${NORMAL}" && exit
}

# ★★★Installation★★★
echo && echo " ${BLUE}Gdutils${NORMAL} Telegram Bot by ${RED}iwestlin${NORMAL} - Polished by ${RED}Roshanconnor${NORMAL}

1.${CYAN}Complete Installation${NORMAL}
=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=
${YELLOW}Individual Installation${NORMAL}

2.${GREEN}Installation Of Gdutils${NORMAL}
3.${GREEN}Downloading Service Accounts From Github${NORMAL}
4.${GREEN}Running the Gdutils Server${NORMAL}
5.${GREEN}Configuring Nginx${NORMAL}
6.${GREEN}Runnng the Bot${NORMAL}
=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=
69.${PURPLE}Exit${NORMAL}" && echo
read -p " Choose any Number [1-6]:" option

case "$option" in
1)
    gdutils
	sa
	server
	nginx
	bot
	;;
2)
    gdutils
    ;;
3)
    sa
    ;;
4)
    server
    ;;
5)
    nginx
    ;;
6)
    bot
    ;;
69)
    exit
    ;;
*)
    echo
    echo " ${RED}Choose Correct Number from the Options${NORMAL}"
    ;;
esac  