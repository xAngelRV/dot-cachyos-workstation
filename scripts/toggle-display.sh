#!/usr/bin/env bash
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export WAYLAND_DISPLAY=$(basename "$(ls "$XDG_RUNTIME_DIR"/wayland-* 2>/dev/null | grep -v "\.lock$" | head -n1)")
if kscreen-doctor -o | grep -q "2560x1440@59.95\*"; then
    kscreen-doctor output.HDMI-A-1.mode.1920x1080@120
    notify-send "Pantalla ASUS" "Modo Fluidez: 1080p @ 120Hz" -t 2000
else
    kscreen-doctor output.HDMI-A-1.mode.2560x1440@60
    notify-send "Pantalla ASUS" "Modo Nitidez: 2K @ 60Hz" -t 2000
fi
