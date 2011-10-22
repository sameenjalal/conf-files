#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec awesome


DEFAULT_SESSION=awesome

case $1 in
awesome)
	kmix --keepvisibility &
	exec awesome &
	sudo conky &
	;;
kde)
	exec startkde
	;;
xfce4)
	exec startxfce4
	;;
gnome)
	exec gnome-session
	;;
*)
	#sudo chown samjalal:users /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor &
	#sudo chmod 777 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor &

	#sudo chown samjalal:users /sys/devices/virtual/backlight/acpi_video0/brightness &
	#sudo chmod 777 /sys/devices/virtual/backlight/acpi_video0/brightness &

	kmix --keepvisibility &
	exec $DEFAULT_SESSION &
	avg
	;;
esac
