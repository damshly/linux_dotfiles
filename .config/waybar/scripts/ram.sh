#!/bin/bash
# ~/.config/waybar/scripts/ram_usage.sh
MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
MEM_AVAILABLE=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
MEM_USED=$((MEM_TOTAL - MEM_AVAILABLE))
MEM_PERCENT=$((MEM_USED * 100 / MEM_TOTAL))
echo " RAM ${MEM_PERCENT}%"
