#!/usr/bin/env bash


# Terminate existing polybar process

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c "$HOME/.config/polybar/config.ini" & 
if [[ -n $EXTERNAL_MONITOR ]] then 
  polybar external -c "$HOME/.config/polybar/config.ini" &
fi
