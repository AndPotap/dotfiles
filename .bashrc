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
eval `dircolors -b $HOME/.dir_colors`

# Start ssh-agent if not already running
# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/tpu_deploy
# fi

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
if [ -t 0 ]; then
    stty intr ^P
fi
# https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash
# stty -ixon
#   Not sure why I added this command on the first place

source "$HOME/.cargo/env"
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
	local BLUE="32"

    local BACKGROUND=${BOX_COLOR:-$GREEN}
    local TEXT_FORMAT_1="\[\033[1;38;5;${BACKGROUND}m\]"

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

# ---------------------------------------------------------------------------
BOX_COLOR_FILE="$HOME/.box_color"
BOX_COLOR_DEFAULT=73
BOX_COLOR_PALETTE=(73 118 135 172 32 203 214 42 69 141 180 110)

box_color_identity() {
    local meta=/opt/ml/metadata/resource-metadata.json id=""
    if [ -r "$meta" ]; then
        id=$(sed -n 's/.*"SpaceName":"\([^"]*\)".*/\1/p' "$meta")
    fi
    [ -z "$id" ] && [ -r /etc/machine-id ] && id=$(cat /etc/machine-id)
    [ -z "$id" ] && id=$(hostname)
    printf '%s' "$id"
}

box_color_suggest() {
    local n
    n=$(box_color_identity | cksum | cut -d' ' -f1)
    echo "${BOX_COLOR_PALETTE[$(( n % ${#BOX_COLOR_PALETTE[@]} ))]}"
}

box_color_pick() {
    local suggestion answer c
    suggestion=$(box_color_suggest)
    bash "$HOME/dotfiles/colors.txt"
    echo
    printf 'Curated (readable with black text): '
    for c in "${BOX_COLOR_PALETTE[@]}"; do
        printf '%s%s%s ' "$(tput setaf "$c")" "$c" "$(tput sgr0)"
    done
    echo
    read -r -p "Box color 0-255 for $(box_color_identity) [$(tput setaf "$suggestion")${suggestion}$(tput sgr0)]: " answer
    answer=${answer:-$suggestion}
    if ! [[ "$answer" =~ ^[0-9]+$ ]] || [ "$answer" -gt 255 ]; then
        echo "Invalid color '$answer', using $suggestion" >&2
        answer=$suggestion
    fi
    echo "$answer" > "$BOX_COLOR_FILE"
    echo "Saved $answer to $BOX_COLOR_FILE"
}

box_color_init() {
    BOX_COLOR=""
    if [ -r "$BOX_COLOR_FILE" ]; then
        read -r BOX_COLOR < "$BOX_COLOR_FILE"
    elif [[ $- == *i* ]] && [ -t 0 ] && [ -t 1 ]; then
        box_color_pick
        read -r BOX_COLOR < "$BOX_COLOR_FILE"
    fi
    [[ "$BOX_COLOR" =~ ^[0-9]+$ ]] || BOX_COLOR=$BOX_COLOR_DEFAULT
    export BOX_COLOR
}
# ---------------------------------------------------------------------------

PROMPT_COMMAND=bash_prompt_command
box_color_init
bash_prompt
unset bash_prompt

export PATH="$HOME/.pixi/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ubu/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/ubu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ubu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ubu/Downloads/google-cloud-sdk/completion.bash.inc'; fi
