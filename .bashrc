complete -d cd
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize
HISTSIZE=1000
HISTFILESIZE=2000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:history:c:cg:g[acds]:gpp:gac"
GCC_COLORS='error=01;31:warning=01;35:note=01;36'
export GCC_COLORS+=':caret=01;32:locus=01:quote=01'
# eval `dircolors -b $HOME/.dir_colors`

export NVIMPY=$(which python3)

export EDITOR=nvim
export TERM=screen-256color
set -o vi
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
bind -m vi-command '"\C-f": "\C-z\ec\C-z"'
bind -m vi-insert '"\C-f": "\C-z\ec\C-z"'
# bind -x '"\C-y": "\C-c"'
stty intr ^P
# https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash
# stty -ixon
#   Not sure why I added this command on the first place

source "$HOME/.bash_aliases"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

IS_SINGULARITY=$([[ ! -z "${SINGULARITY_NAME}" ]] && echo 1 || echo 0)
bash_prompt_command() {
	local pwdmaxlen=250
	local trunc_symbol=".."
	local dir=${PWD##*/}

	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

	NEW_PWD=${PWD/#$HOME/\~}

	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi
}

bash_prompt() {

	local ELIMINATE_FORMAT="\[\033[0m\]"
	local DARKBLUE="4"
	local DARKGREY="242"
	local DARKPURPLE="135"
	local RED="196"
	local TOXIC_GREEN="118"
    local GREEN="73"
	local ORANGE="172"
	local YELLOW="227"

    # Modify below to change the background / sync with TMUX
    local BACKGROUND=$YELLOW
    local TEXT_FORMAT_1="\[\033[1;38;5;${YELLOW}m\]"

    case "$HOSTNAME" in
        "ubu")
            TEXT_FORMAT_1="\[\033[0;38;5;${DARKBLUE}m\]"
            ;;
        "ubu-MS")
            TEXT_FORMAT_1="\[\033[0;38;5;${DARKBLUE}m\]"
            ;;
    esac

	if [ "$USER" = root ]; then
        TEXT_FORMAT_1="\[\033[1;38;5;${RED}m\]"
	fi

	local TEXT_FORMAT_2="\[\033[1;38;5;${DARKGREY}m\]"
	local TEXT_FORMAT_3="\[\033[1;38;5;0m\]"
    local PROMT_FORMAT="\[\033[1;38;5;${DARKGREY}m\]"

	local PROMT_SINGULARITY=$"\[\033[1;38;5;${ORANGE}m\]<SIN>"
	local PROMT_USER=$"$TEXT_FORMAT_1\u"
	local PROMT_HOST=$"$TEXT_FORMAT_2\h$PROMT_FORMAT"
	local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD}$ELIMINATE_FORMAT$PROMT_FORMAT"
	local PROMT_INPUT=$"$PROMT_FORMAT "

	local ICONS=':::'
	local ARROWS=' ->->->'
	local SEPARATOR_2="\[\033[48;5;${BACKGROUND}m\]\[\033[1;38;5;0m\]${ICONS}"
	local SEPARATOR_3="\[\033[1;38;5;${DARKGREY}m\]${ARROWS}"

	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac

    if [[ ${IS_SINGULARITY} == "1" ]]; then
        PS1="$TITLEBAR\n${PROMT_SINGULARITY}"
    else
        PS1="$TITLEBAR\n${PROMT_USER}"
    fi
    PS1+="@${PROMT_HOST} "
    PS1+="${SEPARATOR_2}${PROMT_PWD} \n"
    PS1+="${SEPARATOR_3}${PROMT_INPUT}"
    PS1+="${ELIMINATE_FORMAT}"
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
