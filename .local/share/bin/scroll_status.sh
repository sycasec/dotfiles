#!/usr/bin/env bash

# Run zscroll with Spotify status and scroll it when playing
zscroll -l 20 \
  --delay 0.15 \
  --scroll-padding "  " \
  --match-command "get_status.sh" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  --update-check true "get_status.sh" &

wait
