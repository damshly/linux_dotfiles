#!/bin/bash

option=$(printf "🔄 Restart\n⏻ Shutdown\n🚪 Logout\n💤 Sleep\n🛑 Hibernate" | wofi --dmenu --prompt "System" --height 300)

case "$option" in
"🔄 Restart")
  systemctl reboot
  ;;
"⏻ Shutdown")
  systemctl poweroff
  ;;
"🚪 Logout")
  hyprctl dispatch exit
  ;;
"💤 Sleep")
  systemctl suspend
  ;;
"🛑 Hibernate")
  systemctl hibernate
  ;;
esac
