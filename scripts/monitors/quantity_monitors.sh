#!/bin/sh

#include lib
. ./lib/dual_monitors.lib
. ./lib/triple_monitors.lib

if [ ! -f "/tmp/hostname_mode.bat" ]; then
    hostname_mode= `hostname`
else
    hostname_mode=`cat /tmp/hostname_mode.bat`
fi

if [ "$hostname_mode" == "crypto" ]; then
    dual
else
    triple
fi

echo "${hostname_mode}" > /tmp/hostname_mode.bat
