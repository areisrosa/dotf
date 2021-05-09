#!/usr/bin/env bash

intern_output="eDP-1"
extern_output="DP-1"
extern_output_2="HDMI-1"
extern_output_3="HDMI-2"

if [ ! -f "/tmp/monitor_mode.dat" ] ; then
    monitor_mode="mirror"
else
    monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ "$monitor_mode" == "mirror" ]; then
    monitor_mode="triple"
    xrandr --output $intern_output --primary --mode 1366x768 --pos 3000x1152 --rotate normal --output $extern_output --mode 1920x1080 --pos 0x840 --rotate normal --output $extern_output_1 --off --output DP-2 --off --output $extern_output_3 --mode 1920x1080 --pos 1920x0 --rotate right
else
    monitor_mode="mirror"
    xrandr --output $intern_output --auto --output $extern_output --auto --output $extern_output_3 --auto --same-as $intern_output
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
