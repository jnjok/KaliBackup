# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#My Init

alias alis=~/show_aliases
alias reb='source ~/.reb'
alias hlt='source ~/.hlt'
alias vib='vim + ~/.bashrc'
alias srb='source ~/.bashrc'
alias init='xrandr -s 1680x1050;xmodmap ~/CapsToCtrl2;exit'
alias ctc='source ~/CapsToCtrl'
alias rstc='source ~/CapsRestore'
alias f='/usr/games/fortune'
alias lsr='ls -hartl'
alias lsa='ls -a'
alias lsl='ls -l'
alias rub=/usr/bin/ruby
alias xgl=/usr/games/xgalaga-hyperspace
alias xm='xmodmap'
alias xme='xmodmap -e'
alias bkv='cp ~/.vimrc ~/repos/KaliBackup'
alias bkb='cp ~/.bashrc ~/repos/KaliBackup'
alias hn='hostname'
alias vrm='vim ~/remember'
alias rmswp='rm .*swp'

# Git aliases
alias gpr='source ~/set_gitprompt'
alias mpr='source ~/set_myprompt'
alias gco='git commit -a'
alias cdv='cd ~/repos/various_voices'
alias cdk='cd ~/repos/KaliBackup'
alias cdw='cd ~/workspace'
alias cdwh='cd ~/workspace/hello_app'
alias cdwv='cd ~/workspace/various_voices'
alias cdws='cd ~/workspace/sample_app'
alias cdc='cd app/controllers'
alias cdv='cd app/views'
alias cdvs='cd app/views/static_pages'
alias cdvl='cd app/views/layouts'
alias gst='git status'
alias gad='git add -A'
alias glg='git log'
alias gdf='git diff'
alias gacp='gad;gco;git push'
alias gck='git checkout'
alias gbr='git branch'
alias gpl='git pull'
alias gckm='git checkout master'
alias ho='heroku open'
alias apc='vim app/controllers/application_controller.rb'
alias gphm='git push heroku master;ho'
alias gh='gacp;gphm'
alias rts='vim config/routes.rb'
alias hl='heroku logs >> HerokuLogs;echo >> HerokuLogs;echo >> HerokuLogs;vim + HerokuLogs'
alias aph='vim app/helpers/application_helper.rb'

mpr
alias vrmb='vim ~/remember'
cat ~/remember
