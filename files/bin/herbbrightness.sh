#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
##
## Script to manage brightness on Archcraft.

# Icons
iDIR='/usr/share/archcraft/icons/dunst'

# Graphics card
CARD=`ls /sys/class/backlight | head -n 1`

# Get brightness
get_backlight() {
	if [[ "$CARD" == *"intel_"* ]]; then
		BNESS=`xbacklight -get`
		LIGHT=${BNESS%.*}
	else
		LIGHT=$(printf "%.0f\n" `light -G`)
	fi
	echo "${LIGHT}%"
}

# Get icons
get_icon() {
	backlight="$(get_backlight)"
	current="${backlight%%%}"
	level=( 80 60 40 20 0 )
	
	for l in ${level[@]}; do
		if [ "$current" -ge "$l" ]; then
			icon="$iDIR/brightness-$l.png"
		fi
	done
}

# Notify 
notify_bl() {
	get_icon && dunstify -u low -h string:x-dunst-stack-tag:obbacklight -i "$icon" "Brightness : $(get_backlight)"
}

# Increase brightness
inc_backlight() {
	if [[ "$CARD" == *"intel_"* ]]; then
		xbacklight -inc 10 && notify_bl
	else
		light -A 5 && notify_bl
	fi
}

# Decrease brightness
dec_backlight() {
	if [[ "$CARD" == *"intel_"* ]]; then
		xbacklight -dec 10 && notify_bl
	else
		light -U 5 && notify_bl
	fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_backlight
elif [[ "$1" == "--inc" ]]; then
	inc_backlight
elif [[ "$1" == "--dec" ]]; then
	dec_backlight
else
	get_backlight
fi
