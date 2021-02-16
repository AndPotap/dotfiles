HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
export HISTCONTROL=ignoreboth:erasedups
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
GCC_COLORS='error=01;31:warning=01;35:note=01;36'
export GCC_COLORS+=':caret=01;32:locus=01:quote=01'

eval `dircolors ~/.dir_colors`

bind '";":"\e"'
bind "set completion-ignore-case on"
shopt -s cdspell
complete -d cd
source ~/.bash_aliases
xmodmap ~/.xmodmap
set -o vi
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# orange=$(tput setaf 166);
# yellow=$(tput setaf 11);
# green=$(tput setaf 71);
# blue=$(tput setaf 4);
# gray=$(tput setaf 242);
# red=$(tput setaf 9);
# bold=$(tput bold);
# text=$(tput setaf 249);
#
# PS1="\[${bold}\]\n";
# PS1+="\[${blue}\]\u";
# PS1+="\[${gray}\]@\h: ";
# PS1+="\[${green}\]\w ";
# PS1+="\[${text}\]\n --> ";
# export PS1;

bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=25

	# Indicate that there has been dir truncation
	local trunc_symbol=".."

	# Store local dir
	local dir=${PWD##*/}

	# Which length to use
	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

	NEW_PWD=${PWD/#$HOME/\~}

	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	# Generate name
	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi
}

bash_prompt() {

	local NO_FORMAT="\[\033[0m\]"
	local S1="\[\033[0;38;5;4m\]"
	local S2="\[\033[1;38;5;242m\]"
	local S3="\[\033[1;38;5;250m\]"
	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
	local WHITE_BOLD="\[\033[1;38;5;15m\]"
	local BLUE_BOLD="\[\033[1;38;5;74m\]"

    local TEXT_FORMAT_1=$TOXIC_GREEN_BOLD
	local TEXT_FORMAT_2=$S2
	local TEXT_FORMAT_3="\[\033[1;38;5;0m\]"
    PROMT_FORMAT=$S3

	if [ "$HOSTNAME" = Pure ]; then
        TEXT_FORMAT_1=$S1
	fi

	local PROMT_USER=$"$TEXT_FORMAT_1\u"
	local PROMT_HOST=$"$TEXT_FORMAT_2\h$PROMT_FORMAT"
	local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD}$NO_FORMAT$PROMT_FORMAT"
	local PROMT_INPUT=$"$PROMT_FORMAT "

	local ICONS=$'\u058D'' '$'\u058D'' '$'\u058D'' '
	local ARROWS=' '$'\u27A4'' '$'\u27A4'' '$'\u27A4'
	local SEPARATOR_2="\[\033[48;5;73m\]\[\033[1;38;5;0m\]${ICONS}"
	local SEPARATOR_3="\[\033[1;38;5;4m\]${ARROWS}"

	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac

	PS1="$TITLEBAR\n${PROMT_USER}"
    PS1+="@${PROMT_HOST} "
    PS1+="${SEPARATOR_2}${PROMT_PWD} \n"
    PS1+="${SEPARATOR_3}${PROMT_INPUT}"

	none="$(tput sgr0)"
	trap 'echo -ne "${none}"' DEBUG
}


PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pure/google-cloud-sdk/path.bash.inc' ]; then . '/home/pure/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pure/google-cloud-sdk/completion.bash.inc' ]; then . '/home/pure/google-cloud-sdk/completion.bash.inc'; fi
