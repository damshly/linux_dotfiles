#!/bin/bash

# جلب درجة الحرارة (تأكد من المسار حسب جهازك، غالباً k10temp أو coretemp)
temp=$(sensors | grep "Package id 0:" | awk '{print $4}')
if [ -z "$temp" ]; then
    temp=$(sensors | grep "Tctl" | awk '{print $2}')
fi

# جلب التردد لكل نواة وتنسيقها
freqs=$(lscpu -e=CPU,MHZ | tail -n +2 | awk '{printf "Core %s: %.0f MHz\n", $1, $2}')

# إخراج النتيجة للـ Tooltip
echo "Temp: $temp"
echo "----------------"
echo "$freqs"
