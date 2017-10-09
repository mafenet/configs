#!/bin/bash
#
# lock screen with i3/swaylock using the colorscheme generated by wal

#Color config

#Resolution of the wallpaper
width=$(identify ${wal} | grep -o "[[:digit:]]*x" | head -1 | grep -o "[[:digit:]]*" | head -1)
height=$(identify ${wal} | grep -o "x[[:digit:]]*" | head -1 | grep -o "[[:digit:]]*" | head -1)

# change locker and options to fit WM (i3 / sway), swaylock does not yet support time and date strings
if [[ ${DESKTOP_SESSION} == *"i3" ]]; then
	lock="i3lock"
	more_options="-k --timestr=%H:%M --timecolor=${color7//#}ff --datestr=%d.%m.%y --datecolor=${color7//#}ff"
elif [[ ${DESKTOP_SESSION} == *"sway" ]]; then 
	lock="swaylock"
fi


#Use Color instead of wallpaper for images smaller than 1080p
if [[ ${width} -lt 1920 ]] || [[ ${height} -lt 1080 ]]; then
	background="-c ${color0}"
else
	background="-i ${wal}"
fi

${lock} $background  --insidewrongcolor=${color3//#}ff --ringwrongcolor=${color3//#}ff --insidevercolor=${color6//#}ff --ringvercolor=${color6//#}ff --ringcolor=00000000 --linecolor=${color4//#}ff --insidecolor=${color4//#}ff --keyhlcolor=${color7//#}ff --bshlcolor=${color3//#}ff --textcolor=${color0//#}88 -r $more_options
