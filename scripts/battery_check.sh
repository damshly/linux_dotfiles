#!/bin/bash

# العتبة اللي بدك عندها يطلع التنبيه
THRESHOLD=20
# مسار ملف الصوت اللي بدك تشغله
SOUND_PATH="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

while true; do
    # الحصول على نسبة البطارية وحالتها
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
    BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

    # التحقق إذا كانت البطارية عم تفرغ وتحت العتبة
    if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ] && [ "$BATTERY_STATUS" = "Discharging" ]; then
        # إرسال إشعار للنظام
        notify-send -u critical "البطارية منخفضة" "مستوى الشحن: $BATTERY_LEVEL%"
        
        # تشغيل الصوت
        mpv --no-video "$SOUND_PATH" > /dev/null 2>&1
        
        # الانتظار لمدة دقيقتين قبل الفحص مرة تانية مشان ما يضل يزعجك كل ثانية
        sleep 120
    else
        # الفحص كل دقيقة بالوضع الطبيعي
        sleep 60
    fi
done
