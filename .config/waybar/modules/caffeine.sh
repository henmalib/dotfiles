#!/bin/bash

check_status() {
    if pgrep -x "hypridle" > /dev/null; then
        echo '{"class": "off", "text": ""}'
    else
        echo '{"class": "on", "text": ""}'
    fi
    return 0
}

case "$1" in
    status)
        check_status
        ;;
    switch)
        if pgrep -x "hypridle" > /dev/null; then
            pkill -x hypridle
        else
            hyprctl dispatch exec hypridle
        fi
        ;;
    *)
        echo "Usage: $0 {status|switch}"
        exit 1
        ;;
esac
