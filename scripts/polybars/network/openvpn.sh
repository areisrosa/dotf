#!/bin/sh

printf "旅 VPN " && (pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 && echo Down) | head -n 1
