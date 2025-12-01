#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"

get_value() {
    local key="$1"
    sed -n "s/^ *$key *= *//p" "$CONFIG"
}
key="$1"
value="$(get_value "$key")"

for key in "$@"; do 
  value="$(get_value "$key")"
  echo "The current value of '$key' is: $value"
done
