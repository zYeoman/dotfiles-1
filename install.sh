#!/usr/bin/env bash

set -e

# Color
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[0;33m'
none='\e[0m'

clear
echo "Start to initialize your Linux"
echo -e "\n-----------------------------------------------------------\n"

getDistribution () {

    # Every system that we officially support has /etc/os-release
	if [ -r /etc/os-release ]
    then
		linuxName=$(. /etc/os-release && echo "$ID")
    else
        echo -e "${red}Error${none}: The file does not exist."
	fi

	# Returning an empty string here should be alright since the
	# case statements don't act unless you provide an actual value
	echo -e "Your linux distribution is ${linuxName}\n"
}

getDistribution

initializeConfig () {
    echo -e "-----------------------------------------------------------\n"
    echo -e "${green} Install git and its configuration file."
}

if [ ${linuxName}=="ubuntu|debian|raspbian|deepin" ]
then
    initializeConfig
else
    echo "We only support operation system based on Debian or Arch release."
    echo "You can create pull request if you want to support other os."
fi
