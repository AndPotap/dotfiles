# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PYTHONPATH="/home/apotapczynski/uncountable_repamtrick/"
export HISTCONTROL=ignoreboth:erasedups
export f=~

bind '";":"\e"'

orange=$(tput setaf 166);
green=$(tput setaf 71);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${orange}\]\u@mac ";
PS1+="\[${green}\]\w ";
PS1+="\[${orange}\]\n --> ";
PS1+="\[${reset}\]";
export PS1;

source ~/.bash_aliases
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
