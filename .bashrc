# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\n\[\e[36m\][\t]\[\e[m\]\[\e[37m\]\w \[\e[m\]\n$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$'
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# jump path
export MARKPATH=$HOME/.marks
function to {
cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
rm -rf "$MARKPATH/$1"
}
function marks {
ls -l "$MARKPATH" | sed 's/ / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
local curw=${COMP_WORDS[COMP_CWORD]}
local wordlist=$(find $MARKPATH -type l -printf "%f\n")
COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
return 0
}
complete -F _completemarks c unmark
#jump path end
si() {
    ctags -R
    cscope -Rbq
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/tools/bash_aliases ]; then
    . ~/tools/bash_aliases.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
#source ~/.vim/bin/source.rc

function set-title() {
if [[ -z "$ORIG" ]]; then
   ORIG=$PS1
fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}



alias wireshark="LIBOVERLAY_SCROLLBAR=0 /usr/bin/wireshark"
alias git='LANG=en_GB git'
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#export PATH=~/bin:/usr/lib/jvm/java-7-openjdk-amd64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/:$PATH
export PATH=~/bin:/usr/lib/jvm/java-8-openjdk-amd64/bin:usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/:$PATH
export ARCH=arm64
export CROSS_COMPILE=/usr/local/arm/aarch64-toolchain/gcc-linaro-aarch64-linux-gnu-4.8-2014.01_linux/bin/aarch64-linux-gnu-
#export CROSS_COMPILE=/usr/bin/aarch64-linux-gnu-

#nvim ----------
export PATH=~/.config/lib/nvim-linux64/lib/:${PATH}
export PATH=~/.config/lib/nvim-linux64/bin/:${PATH}
export PATH=~/.config/lib/node-v14.16.1-linux-x64/lib/:${PATH}
export PATH=~/.config/lib/node-v14.16.1-linux-x64/bin/:${PATH}

#autojump ----------- 
[[ -s /home/ts/.autojump/etc/profile.d/autojump.sh ]] && source /home/ts/.autojump/etc/profile.d/autojump.sh

#cscope ------------
#cscope env
#CSCOPE=/path/cscope.out
#export CSCOPE

#fzf -----------
export PATH=~/.fzf/bin/:${PATH}
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#ripgrep ----------
export PATH=~/.config/lib/ripgrep-13/:${PATH}

#key-bind
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias gd='git diff'
alias gs='git status'
alias gb='git branch'
