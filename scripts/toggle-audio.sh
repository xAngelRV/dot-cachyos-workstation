#!/usr/bin/env bash
WIN_ID=$(wpctl status | grep -E "scream-virtual-sink|Parlantes PC Windows" | grep -oE "[0-9]+\." | head -n1 | tr -d ".")
LOCAL_ID=$(wpctl status | awk "/Sinks:/,/Sources:/" | grep -vE "scream-virtual-sink|Parlantes PC Windows|Sinks:|Sources:" | grep -oE "[0-9]+\." | head -n1 | tr -d ".")
CURRENT=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep "node.name" | cut -d\" -f2)

if [[ "$CURRENT" == "scream-virtual-sink" ]] && [[ -n "$LOCAL_ID" ]]; then
    wpctl set-default "$LOCAL_ID"
    notify-send -i audio-speakers "Audio: Laptop Local" "Salida cambiada a altavoces internos"
elif [[ -n "$WIN_ID" ]]; then
    wpctl set-default "$WIN_ID"
    notify-send -i network-wired "Audio: Parlantes PC Windows" "Salida enviada por RTP a Windows 11"
fi
