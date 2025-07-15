#!/bin/bash

while true; do
  layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
  echo "{\"text\": \"$layout\"}"
  sleep 0.1
done

