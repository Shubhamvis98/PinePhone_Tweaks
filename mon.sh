#!/bin/bash

[ -z $1 ] && echo -e "\e[31;1mUsage:\e[0m\n\t`basename $0` wlan0" && exit
[ `id -u` -ne 0 ] && echo '[!]Run as root' && exit

IFACE=$1

if [[ `iwconfig $IFACE | grep Managed` ]]
then
	echo -ne '[+]Setting up Monitor Mode\t'
	ip link set $IFACE down
	airmon-ng check kill &>/dev/null
	iwconfig $IFACE mode monitor
	echo 'DONE'

elif [[ `iwconfig $IFACE | grep Monitor` ]]
then
	echo -ne '[+]Setting up Managed Mode\t'
	ip link set $IFACE down
	iwconfig $IFACE mode managed
	systemctl restart NetworkManager
	echo 'DONE'
fi

