# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Misc
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort

if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias grep='grep --color'                     # show differences in colour
    alias egrep='egrep --color=auto'              # show differences in colour
    alias fgrep='fgrep --color=auto'              # show differences in colour

    alias ll='ls -l --color=auto'                 # long list
    alias la='ls -A --color=auto'                 # all but . and ..
    alias l='ls -CF --color=auto'                 #
    alias ltr='ls -ltr --color=auto'    
    alias ls='ls --color'
fi

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
export HISTIGNORE="&:ls:[bf]g:exit"

# Colors
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
LightGrey="$(tput setaf 7)"
LightGreyBG="$(tput setab 7)"

SALMON="$(tput setaf 131)" # Candidates 138, 174, 
MINT="$(tput setaf 71)"
PURPLE="$(tput setaf 96)"
INDIANRED="$(tput setaf 88)" # Candidate 167
PALEVIOLET="$(tput setaf 132)" # Candidate 95
FROSTEDBLUE="$(tput setaf 73)" # Candidate 109
EGGSHELL="$(tput setaf 188)" # Candidate 152
COLE="$(tput setaf 236)"

B_SALMON="$(tput bold ; tput setaf 131)" # Candidates 138, 174, 
B_MINT="$(tput bold ; tput setaf 71)"
B_PURPLE="$(tput bold ; tput setaf 96)"
B_INDIANRED="$(tput bold ; tput setaf 88)" # Candidate 167
B_PALEVIOLET="$(tput bold ; tput setaf 132)" # Candidate 95
B_FROSTEDBLUE="$(tput bold ; tput setaf 73)" # Candidate 109
B_EGGSHELL="$(tput bold ; tput setaf 188)" # Candidate 152
B_COLE="$(tput bold ; tput setaf 236)"

BG_SALMON="$(tput setab 131)" # Candidates 138, 174, 
BG_MINT="$(tput setab 71)"
BG_PURPLE="$(tput setab 96)"
BG_INDIANRED="$(tput setab 88)" # Candidate 167
BG_PALEVIOLET="$(tput setab 132)" # Candidate 95
BG_FROSTEDBLUE="$(tput setab 73)" # Candidate 109
BG_EGGSHELL="$(tput setab 188)" # Candidate 152
BG_COLE="$(tput setab 236)"

NC="$(tput sgr0)" # No Color

PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]]\[$FROSTEDBLUE\][\[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h \[$FROSTEDBLUE\]\[$PALEVIOLET\]\W\[$FROSTEDBLUE\]]\[$EGGSHELL\]\$\[$NC\] '
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]] \[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h \[$FROSTEDBLUE\][\[$SALMON\]\W\[$FROSTEDBLUE\]] [\]\[$EGGSHELL\]\$\[$FROSTEDBLUE\]]\[$NC\] '
#PS1='\[$FROSTEDBLUE\][\[$EGGSHELL\]\A\[$FROSTEDBLUE\]] \[$FROSTEDBLUE\][\[$EGGSHELL\]\u\[$FROSTEDBLUE\]@\[$EGGSHELL\]\h\[$FROSTEDBLUE\]] \[$FROSTEDBLUE\][\[$SALMON\]\W\[$FROSTEDBLUE\]] [\]\[$EGGSHELL\]\$\[$FROSTEDBLUE\]] \[$NC\] '
#PS1='\[$EGGSHELL\][\t] \[$FROSTEDBLUE\]\u@\h \[$SALMON\]\W\[$NC\]\[$EGGSHELL\] \$\[$NC\] '
#PS1='\[$LightBlue\]\u@\h [\W]\$\[$NC\] '
#PS1='\[\e[41m\]\[\e[1;37m\] \u \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] # \[\e[0m\] @ \[\e[41m\]\[\e[1;33m\]\h\[\033[0m\033[0;32m\] ▶\[\033[0m\] ' 
