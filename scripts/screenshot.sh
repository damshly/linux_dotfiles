#!/bin/bash
# Path: ~/.scripts/screenshot.sh

# تحديد المسار واسم الملف بدون رموز ":"
FILE_PATH="$HOME/Pictures/Screenshots/shot_$(date +%Y%m%d_%H%M%S).png"

# الأمر المباشر
/usr/bin/grim "$FILE_PATH"
