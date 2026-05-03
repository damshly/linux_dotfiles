#!/bin/bash

# --- CONFIGURATION ---
THRESHOLD_LOW=30
THRESHOLD_CRITICAL=20
THRESHOLD_FULL=95

# Sound Paths (Update these after downloading your new sounds)
SOUND_LOW="/usr/share/sounds/freedesktop/stereo/Low-battery.mp3"
SOUND_CRITICAL="/usr/share/sounds/freedesktop/stereo/Battery_powering_down.m4a"
SOUND_FULL="/usr/share/sounds/freedesktop/stereo/complete.oga"

# Auto-detect battery path
BAT_PATH=$(find /sys/class/power_supply/ -name "BAT*" | head -n 1)

# --- FUNCTIONS ---
play_alert() {
    local sound_file=$1
    # Check if file exists before playing (Skeptical thinking)
    if [[ -f "$sound_file" ]]; then
        # Use full path to mpv and run it in background
        /usr/bin/mpv --no-video "$sound_file" > /dev/null 2>&1 &
    else
        echo "Error: File $sound_file not found." >> /tmp/battery_debug.log
    fi
}

send_notification() {
    local urgency=$1
    local title=$2
    local message=$3
    # We use '|| true' so the script doesn't crash if notifications are broken
    notify-send -u "$urgency" "$title" "$message" || echo "Notify-send failed"
}

# --- MAIN LOOP ---
while true; do
    if [[ -z "$BAT_PATH" ]]; then exit 1; fi

    level=$(cat "$BAT_PATH/capacity")
    status=$(cat "$BAT_PATH/status")

    if [[ "$status" == "Discharging" ]]; then
        if [[ "$level" -le "$THRESHOLD_CRITICAL" ]]; then
            send_notification "critical" "CRITICAL" "Level: $level%"
            play_alert "$SOUND_CRITICAL"
            sleep 30
        elif [[ "$level" -le "$THRESHOLD_LOW" ]]; then
            send_notification "normal" "Low Battery" "Level: $level%"
            play_alert "$SOUND_LOW"
            sleep 120
        else
            sleep 60
        fi
    elif [[ "$status" == "Full" ]] && [[ "$level" -ge "$THRESHOLD_FULL" ]]; then
        send_notification "normal" "Full" "Unplug charger"
        play_alert "$SOUND_FULL"
        sleep 600
    else
        sleep 60
    fi
done
