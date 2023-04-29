#!/usr/bin/env bash

op=$( echo -e " Poweroff\n󰜉 Reboot\n Suspend\n Lock\n Logout" | wofi -i --dmenu --lines 7 --prompt 'Sélectionnez une action' | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                systemctl poweroff
                ;;
        reboot)
                systemctl reboot
                ;;
        suspend)
                systemctl $op
                ;;
        lock)
		bash $HOME/.config/scripts/lock.sh
                ;;
        logout)
                swaymsg exit
                ;;
esac