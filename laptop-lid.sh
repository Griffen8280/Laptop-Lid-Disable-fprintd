#!/bin/bash

lock=$HOME/fprint-disabled

while true; do
    if grep -Fq closed /proc/acpi/button/lid/*/state #&&
       #grep -Fxq connected /sys/class/drm/card0-HDMI-A-1/status
    #Uncomment the && and the grep line to enable a secondary check for external display connection
    then
      touch "$lock"
      systemctl stop fprintd
      systemctl mask fprintd
    elif [ -f "$lock" ]
    then
      systemctl unmask fprintd
      systemctl start fprintd
      rm "$lock"
    fi
done
