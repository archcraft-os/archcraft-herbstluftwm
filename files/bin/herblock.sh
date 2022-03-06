#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Get colors -----------------
FG="#20262C"
BG="#EEEEEE"

BLACK="#20262C"
RED="#D34651"
GREEN="#98c379"
YELLOW="#e5c07b"
BLUE="#61afef"
MAGENTA="#c678dd"
CYAN="#56b6c2"
WHITE="#abb2bf"
GRAY="#BDBAB5"

TOTD=`fortune -n 90 -s | head -n 1`

## Exec	-----------------
i3lock \
--color="${BG}D9"			\
\
--insidever-color=${FG}	\
--insidewrong-color=${RED}	\
--inside-color="${BG}00"	\
\
--ringver-color=${FG}	\
--ringwrong-color=${RED}	\
--ring-color=${FG}		\
\
--line-color=${BG}			\
--separator-color=${BG}		\
\
--keyhl-color=${GRAY}		\
--bshl-color=${RED}			\
\
--verif-color=${BG}			\
--wrong-color=${FG}			\
--layout-color=${FG}		\
\
--time-color=${FG}			\
--date-color=${FG}			\
\
--pass-media-keys			\
--pass-screen-keys			\
--pass-power-keys			\
--pass-volume-keys			\
--{time,date,layout,verif,wrong,greeter}-font="JetBrains Mono Medium"			\
--{layout,verif,wrong,greeter}-size=18							\
--time-size=34													\
--date-size=18													\
--greeter-text="${TOTD}"			\
--greeter-color=${FG}				\
--verif-text="verifying..."			\
--wrong-text="wrong!"				\
--noinput-text="Empty"				\
--lock-text="Locking..."			\
--lockfailed-text="Failed to lock"	\
--radius 120				\
--ring-width 8.0			\
--screen 1					\
--clock						\
--indicator					\
--time-str="%I:%M %p"		\
--date-str="%b %d, %G"		\
#--blur 5					\
