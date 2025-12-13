#!/bin/bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
icon="🔋"
if [[ $status == "Charging" ]]; then
    icon="⚡"
fi
echo "$icon $bat%"
