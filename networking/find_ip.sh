#!/bin/bash

#Scans the network and finds the IP for a given MAC address.

#Usage: ./find_ip.sh network_interface target_mac_address

if [ $# -ne 2 ]; then
    echo $0: usage: ./find_ip.sh network_interface target_mac_address
    exit 1
fi

IFACE=$1
MAC=$2
IP=$(ip addr show | grep $IFACE | grep inet | awk '{print $2}' | cut -d "/" -f 1)
CIDR=$(ip addr show | grep $IFACE | grep inet | awk '{print $2}' | cut -d "/" -f 2)

nmap -sP $IP/$CIDR | awk -v mac=$MAC '/report for/{ip=$5}$0~mac{print ip}'
