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

format_font()
{
	## FIRST ARGUMENT TO RETURN FORMAT STRING
	local output=$1

	case $# in
	2)
		eval $output="'\[\033[0;${2}m\]'"
		;;
	3)
		eval $output="'\[\033[0;${2};${3}m\]'"
		;;
	4)
		eval $output="'\[\033[0;${2};${3};${4}m\]'"
		;;
	*)
		eval $output="'\[\033[0m\]'"
		;;
	esac
}


bash_prompt() {

	## FONT EFFECT
	local      BOLD='1'
	local       DIM='2'
	local UNDERLINE='4'
	local     BLINK='5'
	local    INVERT='7'
	local    HIDDEN='8'

	## COLORS
	local   DEFAULT='9'
	local     BLACK='0'
	local      BLUE='4'
    local       CHH='5'
	local    D_GRAY='60'
	local    L_BLUE='64'
	local L_MAGENTA='65'
	local    L_CYAN='66'
	local     WHITE='67'

	## TYPE
	local     RESET='0'
	local    EFFECT='0'
	local     COLOR='30'
	local        BG='40'


	## 256 COLOR CODES
	local NO_FORMAT="\[\033[0m\]"
	local S1="\[\033[0;38;5;4m\]"
	local S2="\[\033[1;38;5;242m\]"
	local S3="\[\033[1;38;5;250m\]"
	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
	local WHITE_BOLD="\[\033[1;38;5;15m\]"
	local BLUE_BOLD="\[\033[1;38;5;74m\]"

	############################################################################
	## CONFIGURATION                                                          ##
	## Choose your color combination here                                     ##
	############################################################################
	local FONT_COLOR_1=$WHITE
	local BACKGROUND_1=$BLUE
	local TEXTEFFECT_1=$BOLD

	local FONT_COLOR_2=$WHITE
	local BACKGROUND_2=$L_BLUE
	local TEXTEFFECT_2=$BOLD

	local FONT_COLOR_3=$D_GRAY
	local BACKGROUND_3=$WHITE
	local TEXTEFFECT_3=$BOLD

	# local PROMT_FORMAT=$BLUE_BOLD
	local PROMT_FORMAT=$BLUE_BOLD

	############################################################################
	## EXAMPLE CONFIGURATIONS                                                 ##
	## I use them for different hosts. Test them out ;)                       ##
	############################################################################


	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local TEXT_FORMAT_1
	local TEXT_FORMAT_2
	local TEXT_FORMAT_3
	local TEXT_FORMAT_4

    TEXT_FORMAT_1=$TOXIC_GREEN_BOLD
    TEXT_FORMAT_2=$S2
    PROMT_FORMAT=$S3

	if [ "$HOSTNAME" = Pure ]; then
		FONT_COLOR_1=$CHH; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD
		FONT_COLOR_2=$L_MAGENTA; BACKGROUND_2=$BLACK; TEXTEFFECT_2=$BOLD
        TEXT_FORMAT_1=$S1
		FONT_COLOR_3=$BLACK; BACKGROUND_3=$L_CYAN; TEXTEFFECT_3=$BOLD
		# PROMT_FORMAT=$WHITE_BOLD
	fi

	## CONVERT CODES: add offset
	FC1=$(($FONT_COLOR_1+$COLOR))
	BG1=$(($BACKGROUND_1+$BG))
	FE1=$(($TEXTEFFECT_1+$EFFECT))

	FC2=$(($FONT_COLOR_2+$COLOR))
	BG2=$(($BACKGROUND_2+$BG))
	FE2=$(($TEXTEFFECT_2+$EFFECT))

	FC3=$(($FONT_COLOR_3+$COLOR))
	BG3=$(($BACKGROUND_3+$BG))
	FE3=$(($TEXTEFFECT_3+$EFFECT))

	FC4=$(($FONT_COLOR_4+$COLOR))
	BG4=$(($BACKGROUND_4+$BG))
	FE4=$(($TEXTEFFECT_4+$EFFECT))

	# format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1
	# format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2
	format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3
	format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4

	# GENERATE PROMT SECTIONS
	local PROMT_USER=$"$TEXT_FORMAT_1\u"
	local PROMT_HOST=$"$TEXT_FORMAT_2\h$PROMT_FORMAT"
	local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD}$NO_FORMAT$PROMT_FORMAT"
	local PROMT_INPUT=$"$PROMT_FORMAT --> "

	############################################################################
	## SEPARATOR FORMATING                                                    ##
	## Generate the separators between sections                               ##
	## Uses background colors of the sections                                 ##
	############################################################################

	## CONVERT CODES
	TSFC1=$(($BACKGROUND_1+$COLOR))
	TSBG1=$(($BACKGROUND_2+$BG))

	TSFC2=$(($BACKGROUND_2+$COLOR))
	TSBG2=$(($BACKGROUND_3+$BG))

	TSFC3=$(($BACKGROUND_3+$COLOR))
	TSBG3=$(($DEFAULT+$BG))

	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local SEPARATOR_FORMAT_1
	local SEPARATOR_FORMAT_2
	local SEPARATOR_FORMAT_3
	format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
	format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
	format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3

	# GENERATE SEPARATORS WITH FANCY TRIANGLE
    # Look for a unicode table and add after \u
	# local TRIANGLE=$'\uE0B0'
	local TRIANGLE=$'\u058D'' '$'\u058D'' '$'\u058D'' '
	# local MINE=$'\uE4A0'
	local MINE=$'\uE4A0'$'\uE4A0'$'\uE4A0'
	local SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE
	local SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE
	local SEPARATOR_3=$SEPARATOR_FORMAT_3$MINE

	############################################################################
	## WINDOW TITLE                                                           ##
	## Prevent messed up terminal-window titles                               ##
	############################################################################
	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac

	############################################################################
	## BASH PROMT                                                             ##
	## Generate promt and remove format from the rest                         ##
	############################################################################
	PS1="$TITLEBAR\n${PROMT_USER}"
    # PS1+="${SEPARATOR_1}${PROMT_HOST}"
    PS1+="@${PROMT_HOST} "
    PS1+="${SEPARATOR_2}${PROMT_PWD} \n"
    PS1+="${SEPARATOR_3}${PROMT_INPUT}"

	## For terminal line coloring, leaving the rest standard
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
