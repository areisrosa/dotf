#!/usr/bin/env bash

intern_output="eDP-1"
extern_output="HDMI-1"
extern_output_2="DP-1"
extern_output_3="HDMI-2"

if [ ! -f "/tmp/monitor_mode.dat" ] ; then
    monitor_mode="mittor"
else
    monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ "$monitor_mode" == "mirror" ]; then
    monitor_mode="dual"
    xrandr --output $intern_output --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output $extern_output --mode 1920x1080 --pos 0x0 --rotate normal --output $extern_output_2 --off --output $extern_output_3 --off
else
    monitor_mode="mirror"
    xrandr --output $intern_output --auto --output $extern_output --auto --same-as $intern_output
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
