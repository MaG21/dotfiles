# Config

source "$HOME/.git-prompt.sh"
export PS1="\[$(tput setaf 7)\]\$(__git_ps1) \[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\] ->\[$(tput setaf 1)\] \j \[$(tput setaf 7)\]\W\[$(tput setaf 4)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# CUSTOM
export D="${HOME}/Downloads"

fkeyword() {
	if [ $# -eq 3 ]; then
		find $1 -type f -iname "*.git*" -prune -or -iname $2 -exec grep -i $3 {} +
	elif [ $# -eq 2 ]; then
		find $1 -type f -iname "*.git*" -prune -or -iname "*.rb" -or -iname "*.py" -or -iname "*.[ch]" -or -iname "*.js" -exec grep -i $2 {} +
	elif [ $# -eq 1 ]; then
		if [ "$1" = "." ]; then
			echo "WARNING: This will match everything, may not be what you want. Try another pattern."
		else
			find "." -type f -iname "*.git*" -prune -or -iname "*.rb" -or -iname "*.py" -or -iname "*.[ch]" -or -iname '*.js' -exec grep -i $1 {} +
		fi
	elif [ $# -eq 0 ] || [ $# -gt 3 ]; then
		echo "Usage: [DIR] [PATTERN] KEYWORD"
	fi
}

# NOTE: Most of the time when I copy the path of a directory, I'm planning on
#       doing something there, usually, to open a new terminal in said
#       directory, so I will save myself the trouble of this repetitive task.
#
# Check if the content of the clipboard is a directory,
# if it is, cd to said directory.  MAC only :grin:

if type pbpaste &> /dev/null; then
	CLIPBOARD=$(pbpaste)
	if [ -d "$CLIPBOARD" ]; then
		cd $CLIPBOARD
	fi
fi

# Set Vim mode
set -o vi

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Useful aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls="ls -G"
alias rm="rm -i"

alias copycwd="pwd | tr -d '\n' | pbcopy"

# RVM
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
