# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export HISTCONTROL=ignoreboth:erasedups
export f=~

bind '";":"\e"'
bind "set completion-ignore-case on"
shopt -s cdspell
complete -d cd

orange=$(tput setaf 166);
yellow=$(tput setaf 11);
green=$(tput setaf 71);
blue=$(tput setaf 4);
gray=$(tput setaf 242);
red=$(tput setaf 9);
bold=$(tput bold);
# reset=$(tput sgr0);
text=$(tput setaf 249);

PS1="\[${bold}\]\n";
PS1+="\[${blue}\]\u";
PS1+="\[${gray}\]@\h: ";
PS1+="\[${green}\]\w ";
# PS1+="\[${blue}\]\n --> ";
# PS1+="\[${reset}\]";
PS1+="\[${text}\]\n --> ";
export PS1;

source ~/.bash_aliases
xmodmap ~/.xmodmap
set -o vi

# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#     vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
