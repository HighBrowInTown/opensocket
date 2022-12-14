#!/bin/bash

DST_IP="${1}"
PORT="${2}"

HELP () {

    echo "${0} <DESTINATION IPADDRESS> <PORT>"    
}

VARIABLE_CHK () {

    [ "x${DST_IP}" == "x" ] && echo "Error: Undefined Destination IP" && HELP && exit
    [ "x${PORT}" == "x" ] && echo "Error: Undefine PORT" && HELP && exit

}

OPEN_PORT () {

    while true 
    do 
        socat tcp4-listen:"${PORT}",reuseaddr tcp:"${DST_IP}:${PORT}" > /dev/null & disown
    done

}

INFO () {

    echo "ALL traffic received on port ${PORT} will be forwarded to ${DST_IP}:${PORT}"
    
}



MAIN () {

    VARIABLE_CHK
    INFO
    OPEN_PORT
}

MAIN