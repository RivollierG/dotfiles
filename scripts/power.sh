#!/usr/bin/env bash
poweroff=""
reboot=""
lock=""
suspend=""
logout=""
options="$lock\n$suspend\n$logout\n$reboot\n$poweroff"


op=$( echo -e $options | wofi -c ~/scripts/powerwofi/config -s ~/scripts/powerwofi/style.css)

case $op in 
        $poweroff)
                systemctl poweroff
                ;;
        $reboot)
                systemctl reboot
                ;;
        $suspend)
                systemctl suspend
                ;;
        $lock)
                $HOME/scripts/lock.sh
                ;;
        $logout)
                swaymsg exit
                ;;
esac
