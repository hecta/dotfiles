# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Misc
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias rm='rm -i'
alias mv='mv -i'

alias diskspace='du -S |sort -n -r|more'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'

# 10k lines history
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
HISTCONTROL=erasedups
export HISTIGNORE="&:ls:[bf]g:exit"

# Colors
RS="\[\034[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

RC="\[$(tput sgr0)\]"

# prompt
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PS1="[$FYEL\w$RC]$FWHT\\$ $RC"

LS=" --color=auto"

case $(uname -s) in
    Darwin|FreeBSD|OpenBSD) LS="";;
    CYGWIN_NT-6.2-WOW64)
        PS1="$INV\u@\h$RC [$FYEL\w$RC]$FWHT\\$ $RC";;
        #PS1="$INV \u@\h $RS[$FYEL\w$RS]$FWHT\\$ $RS";;
    *) ;;
esac

if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias grep='grep $LS'                     # show differences in colour
    alias egrep='egrep $LS'              # show differences in colour
    alias fgrep='fgrep $LS'              # show differences in colour


    alias ll='ls -lF$LS'
    alias la='ls -AF $LS'                             # all but . and ..
    alias l='ls -CF $LS'                 
    alias ltr='ls -ltrF $LS'    
    alias ls='ls -F $LS'
fi


#PS1="$HC$FYEL[ $FBLE${debian_chroot:+($debian_chroot)}\u$FYEL: $FBLE\w $FYEL]\\$ $RS"
#PS1="$INV ${debian_chroot:+($debian_chroot)}\u@\h $RS $FYEL\w$RS \\$ "

# without timestamp
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h \[$FROSTEDBLUE\]\[$PALEVIOLET\]\W\[$FROSTEDBLUE\]]\[$EGGSHELL\]\$\[$NC\] '
# with timestamp
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]]\[$FROSTEDBLUE\][\[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h \[$FROSTEDBLUE\]\[$PALEVIOLET\]\W\[$FROSTEDBLUE\]]\[$EGGSHELL\]\$\[$NC\] '
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]] \[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h \[$FROSTEDBLUE\][\[$SALMON\]\W\[$FROSTEDBLUE\]] [\]\[$EGGSHELL\]\$\[$FROSTEDBLUE\]]\[$NC\] '
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]] \[$FROSTEDBLUE\][\[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h\[$FROSTEDBLUE\]] \[$FROSTEDBLUE\][\[$SALMON\]\W\[$FROSTEDBLUE\]] [\]\[$EGGSHELL\]\$\[$FROSTEDBLUE\]] \[$NC\] '
#PS1='\[$EGGSHELL\][\t] \[$FROSTEDBLUE\]\u@\h \[$SALMON\]\W\[$NC\]\[$EGGSHELL\] \$\[$NC\] '
#PS1='\[\e[41m\]\[\e[1;37m\] \u \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] # \[\e[0m\] @ \[\e[41m\]\[\e[1;33m\]\h\[\033[0m\033[0;32m\] ▶\[\033[0m\] ' 
#PS1='\[\e[30;47m\] \u@\h \[\e[0m\] \[\e[33m\]\w\[\e0\] \\$ '
