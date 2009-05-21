# .bashrc

#
# $Id: .bashrc,v 1.1 2004/05/03 15:40:00 roth Exp $
#
# Created by Ted Roth
#

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source the debian supplied user .bashrc file
if [ -f ~/.bashrc-debian ]; then
	. ~/.bashrc-debian
fi

# aliases for bash shell
alias date='date +"%a %b %e %l:%M %p"'
alias ls='ls -F --color=auto'
alias la='ls -a'
alias l='ls -lh'
alias lc='ls -al'
alias resh='source ~/.bash_profile'
alias rm='rm -i'
alias cp='cp -i'

#alias path='echo $PATH'

alias dlp='lp -o sides=two-sided-long-edge'

alias cpatch='$HOME/bin/cpatch'
alias spatch='$HOME/bin/spatch'

alias davarice='avarice --ignore-intr :1212'

alias qmake='qmake-qt4'

function path ()
{
	(IFS=":"; for p in $PATH; do echo $p; done)
}

function cpd ()
{
    eval cd $(cat $HOME/.curr_proj_dir 2>/dev/null)
}

# Function to add a dir to the end of PATH
function addpath ()
{
	if [ -n $1 ]
	then
		PATH="${PATH}:${1}"
		export PATH
		echo "PATH is now:"
		echo $PATH
	fi
}

# Function to add a dir to the beginning (front) of PATH
function faddpath ()
{
	if [ -n $1 ]
	then
		PATH="${1}:${PATH}"
		export PATH
		echo "PATH is now:"
		echo $PATH
	fi
}

function rmpath ()
{
	if [ -x $HOME/bin/rmpath.py ]
	then
		# If no args given , then rmpath.py will just remove duplicity
		# from PATH and will always remove '.'.
		PATH=$($HOME/bin/rmpath.py $@)
		export PATH
		echo "PATH is now:"
		echo $PATH
	fi
}

# call rmpath to clean up PATH variable
rmpath >/dev/null 2>&1
