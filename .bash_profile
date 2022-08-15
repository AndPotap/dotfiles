HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
export HISTCONTROL=ignoreboth:erasedups
GCC_COLORS='error=01;31:warning=01;35:note=01;36'
export GCC_COLORS+=':caret=01;32:locus=01:quote=01'

shopt -s cdspell
complete -d cd
source ~/.bash_aliases
set -o vi
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

IS_SINGULARITY=$([[ ! -z "${SINGULARITY_NAME}" ]] && echo 1 || echo 0)
bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=250

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

	local EliminatFormat="\[\033[0m\]"

    # before the m is the color <COLOR_NUM>m
	local DarkBlue="\[\033[0;38;5;4m\]"
	local DarkGrey="\[\033[1;38;5;242m\]"
	local DarkPurple="\[\033[1;38;5;135m\]"
	local Red="\[\033[1;38;5;196m\]"
	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"

    local TEXT_FORMAT_1=$TOXIC_GREEN_BOLD
	local TEXT_FORMAT_2=$DarkGrey
	local TEXT_FORMAT_3="\[\033[1;38;5;0m\]"
    PROMT_FORMAT=$DarkGrey

	if [ "$HOSTNAME" = ubu ]; then
        TEXT_FORMAT_1=$DarkBlue
	fi

	if [ "$USER" = root ]; then
        TEXT_FORMAT_1=$Red
	fi

	if [ "$USER" = pop ]; then
        TEXT_FORMAT_1=$DarkPurple
	fi

	local PROMT_SINGULARITY=$"$TEXT_FORMAT_1<SINGULARITY>"
	local PROMT_USER=$"$TEXT_FORMAT_1\u"
	local PROMT_HOST=$"$TEXT_FORMAT_2\h$PROMT_FORMAT"
	local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD}$EliminatFormat$PROMT_FORMAT"
	local PROMT_INPUT=$"$PROMT_FORMAT "

	local ICONS=':::'
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

    if [[ ${IS_SINGULARITY} == "1" ]]; then
        PS1="$TITLEBAR\n${PROMT_SINGULARITY} "
    else
        PS1="$TITLEBAR\n${PROMT_USER}"
        PS1+="@${PROMT_HOST} "
    fi
	PS1="$TITLEBAR\n${PROMT_USER}"
    PS1+="@${PROMT_HOST} "
    PS1+="${SEPARATOR_2}${PROMT_PWD} \n"
    PS1+="${SEPARATOR_3}${PROMT_INPUT}"
    PS1+="${EliminatFormat}"

}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
