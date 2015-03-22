# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true

set_prompt () {
    Last_Command=$?
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Orange='\[\e[00;33m\]'
    Red='\[\e[01;31m\]'
    Pink='\[\e[00;35m\]'
    Purple='\[\e[01;35m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    PS1="\\n"

    if [[ $Last_Command != 0 ]]; then
        PS1+="$Red$FancyX "
    fi

    if [[ $EUID == 0 ]]; then
	UserColor=$Red        
    else
	UserColor=$Pink
    fi

    PS1+="$UserColor# \\u@\\h $Purple\\w$Orange\$(__git_ps1)\\n"
    PS1+="$UserColor\$$Reset "
}
PROMPT_COMMAND='set_prompt'