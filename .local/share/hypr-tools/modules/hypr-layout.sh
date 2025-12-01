#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"

get_value() {
    local key="$1"
    sed -n "s/^ *$key *= *//p" "$CONFIG"
}
key="$1"
value="$(get_value "$key")"

echo "the current value of $key is $value"
