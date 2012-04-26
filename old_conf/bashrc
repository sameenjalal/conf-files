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
#alias conky ='sudo conky &'
alias bus='/filer/tmp2/contrib/bin/bus'


###############################################################################################





#export statements
export PATH=$PATH:/filer/tmp2/contrib/bin:/usr/sbin:/sbin
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/filer/tmp2/contrib/lib/pkgconfig
export EDITOR=vim
export PS1="[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]\$ "

#program shortcuts
alias stalk="~/.stalk w"
alias fox="/filer/tmp2/contrib/bin/firefox"
alias mp="/filer/tmp2/contrib/bin/mplayer"
alias dp="/filer/tmp2/contrib/bin/linuxdcpp"
alias box="~/.dropbox-dist/dropboxd"
alias bashmod="vim ~/.bashrc"
alias bashsave="source ~/.bashrc"
alias vmod="vim ~/.vimrc"

#aliases for book launching
#alias physics="books;acroread Physics-Cutnell\,\ Johnson\ 8th\ Edition.pdf"
#alias cs205="books;acroread Discrete\ Mathematics\ and\ its\ Applications\ -\ Rosen\ -\ 0-07-288008-2.pdf"
#alias micro="books;acroread Microeconomics.4.pdf"
#alias linear="books;acroread Elementary_Linear_Algebra__2nd_Edition_.pdf"

#aliases for ls
alias ls="ls --color=auto"
alias lsd="ls --color=always -al | grep ^d"
alias lf="ls --color=always -l | grep ^d"
alias l="ls"
alias s="l"
alias la="ls -al"
alias ll="ls -l"

#aliases for random ops
alias cc="clear"

#aliases for directory navigation
alias ..="cd .."
#alias vi="vim"
#alias v="vim"
alias doc="cd ~/documents;ls"
alias cs="cd ~/documents/cs211/pa2;ls"
alias drop="cd /filer/tmp2/bilalq/Dropbox;ls"
alias filer="cd /filer/tmp2"
#alias contrib="cd /filer/tmp2/contrib;ls"
#alias tmp="cd /filer/tmp2/bilalq;ls"
#alias media="cd /filer/tmp2/contrib/media;ls"
#alias books="cd /filer/tmp2/contrib/books;ls"
#alias star="cd /filer/tmp2/bilalq/starlabs"
alias me="cd ~;ls"

#ssh aliases
#alias dream="ssh ps61838.dreamhost.com"
#alias facade="ssh facade"
#alias ziti="ssh ziti"

#[[ -s "/filer/tmp2/contrib/bin/.rvm/scripts/rvm" ]] && source "/filer/tmp2/contrib/bin/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias vimt='vim -c "NERDTree" $1'
alias vit='vim -c "NERDTree" $1'
alias vt='vim -c "NERDTree" $1'
alias vi='vim'


