#!/bin/bash
# ~/.config/waybar/scripts/cpu_usage.sh
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
echo " CPU ${CPU%.*}%"
