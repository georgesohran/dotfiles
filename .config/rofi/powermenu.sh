#!/usr/bin/env bash

shutdown=''
reboot=''
suspend=''

rofi_cmd() {
	rofi -dmenu \
    -theme "~/.config/rofi/powermenu.rasi"
}

run_rofi() {
	echo -e "$suspend\n$shutdown\n$reboot\n$lock" | rofi_cmd
}


chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
      systemctl poweroff
        ;;
    $reboot)
      systemctl reboot
        ;;
    $suspend)
      systemctl suspend
        ;;
esac
