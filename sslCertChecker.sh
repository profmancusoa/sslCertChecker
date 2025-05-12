#!/bin/bash
#
# Author: Antonio Mancuso
# Date: 14 Apr 2025
#
# Quick SSL cert expiration checker
#


domains=(
    www.google.com
    www.cisco.com
    www.github.com 
)

len=${#domains[@]}
seperator=-------------------------
rows="%-25s| %-25s\n"


getSSLExpire() {
    # $1: ssl domain to check
    res=$(openssl s_client -showcerts -connect $1:443 <<< "Q" 2>/dev/null | openssl x509 -text | grep "Not After")
    echo $res | awk -F " : " '{print $2}'
}

tableHEder() {
    #print header
    printf "\n$rows" "Certificate" "Expires On"
    printf "$rows" "$seperator" "$seperator"
}

tableBody() {
    #print lines
    for((i=0; i < len; i++)); do
        expiry=$(getSSLExpire ${domains[$i]})
        printf "$rows" ${domains[$i]} "$expiry"
    done
    printf "\n"
}

tableHEder
tableBody