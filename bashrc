#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

extract () {
   if [ -f $1 ] ; then
       case $1 in
	*.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
	*.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
	*.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
	*.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
	*.rar)		unrar x $1 ;;
	*.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
	*.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
	*.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
	*.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
	*.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
	*.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
	*.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
	*)		echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

export SVN_EDITOR=vim
export EDITOR=vim

alias chrome='sudo chromium &'
alias chromium='sudo chromium &'
alias c='sudo chromium &'
alias ..='cd ..'
alias la='ls -la'
alias ll='ls -l'
alias pdf='apvlv'
alias r='ranger'
alias vi='vim'
alias py='python2'
alias wicd='wicd-curses'
alias wi='wicd-curses'
alias conky ='sudo conky &'
alias cpu='cpufreq-info'
alias reboot='sudo reboot'

minspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
maxspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
setspeed='/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq'

sudo chown samjalal:users /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sudo chmod 777 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

sudo chown samjalal:users /sys/devices/virtual/backlight/acpi_video0/brightness
sudo chmod 777 /sys/devices/virtual/backlight/acpi_video0/brightness

fast () {
	echo 'You just made your computer superfast and bright but power hungry' ;
	sudo echo -n 'performance' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ;
	#sudo echo -n '2100000' > $setspeed ;
	sudo echo -n '4' > /sys/devices/virtual/backlight/acpi_video0/brightness ;
}

slow () {
	echo 'You just made your computer slow but eco friendly mode, Captain Planet would be proud' ;
	sudo echo -n 'conservative' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ;
	#sudo echo -n '1200000' > $setspeed ;
	sudo echo -n '0' > /sys/devices/virtual/backlight/acpi_video0/brightness ;
}

avg () {
	echo 'You just put your computer into avg brightness but superfast processing speed, Default Mode' ;
	sudo echo -n 'ondemand' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ;
	#sudo echo -n '2100000' > $setspeed ;
	sudo echo -n '2' > /sys/devices/virtual/backlight/acpi_video0/brightness ;
}

max () {
	echo 'You just entered greedy mode, MAX POWAH!' ;
	sudo echo -n 'performance' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ;
	#sudo echo -n '2100000' > $setspeed ;
	sudo echo -n '7' > /sys/devices/virtual/backlight/acpi_video0/brightness ;
}

alias s2='echo "Sleep mode initiated, get ready to SLEEP!" ; sleep 1 ; sudo s2both ; echo "Welcome back, babycakes!'
alias s2both='echo "Sleep mode initiated, get ready to SLEEP!" ; sleep 1 ; sudo s2both ; echo "Welcome back, babycakes!'
