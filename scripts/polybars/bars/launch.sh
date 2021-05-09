#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 1;
done

# Launch Polybar, using default config location ~/.config/polybar/config
list=$(xrandr | grep -e "\ connected" | cut -d " " -f 1)

for i in $list; do
    MONITOR=$i polybar main &
done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 >>/tmp/polybar1.log 2>&1 &
polybar bar2 >>/tmp/polybar2.log 2>&1 &

echo "Polybar launched..."
