#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"

# قراءة القيم الحالية
OLD_GAPS_IN=$(sed -n 's/^ *gaps_in *= *//p' "$CONFIG")
OLD_GAPS_OUT=$(sed -n 's/^ *gaps_out *= *//p' "$CONFIG")

# تعيين القيم الجديدة افتراضياً كالقيم القديمة
NEW_GAPS_IN=$OLD_GAPS_IN
NEW_GAPS_OUT=$OLD_GAPS_OUT

# قراءة flags
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --gaps-in|-i)
            NEW_GAPS_IN="$2"
            shift 2
            ;;
        --gaps-out|-o)
            NEW_GAPS_OUT="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
    esac
done

# تطبيق التغييرات مؤقتاً
sed -i "s/^ *gaps_in *= *.*/gaps_in = $NEW_GAPS_IN/" "$CONFIG"
sed -i "s/^ *gaps_out *= *.*/gaps_out = $NEW_GAPS_OUT/" "$CONFIG"

echo "Preview:"
echo "gaps_in = $NEW_GAPS_IN"
echo "gaps_out = $NEW_GAPS_OUT"

 hyprctl reload 

read -p "Save changes? (Yes/No): " Save

if [[ $Save =~ ^[Nn]$ ]]; then
    # ارجع للقيم القديمة
    sed -i "s/^ *gaps_in *= *.*/gaps_in = $OLD_GAPS_IN/" "$CONFIG"
    sed -i "s/^ *gaps_out *= *.*/gaps_out = $OLD_GAPS_OUT/" "$CONFIG"
    hyprctl reload
    echo "Changes canceled."
else
    echo "Changes saved."
fi

