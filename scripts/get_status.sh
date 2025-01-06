#!/usr/bin/env bash

# Check if Spotify is running
if ! playerctl --player=spotify status &>/dev/null; then
  echo "No songs? 😴"
  exit 0
fi

# Get the current status of Spotify (Playing/Paused)
status=$(playerctl --player=spotify status)

# Get the current song and artist information
artist=$(playerctl --player=spotify metadata artist)
title=$(playerctl --player=spotify metadata title)

if [[ "$status" == "Playing" ]]; then
  echo " Playing: $artist - $title"
else
  echo " Paused"
fi
