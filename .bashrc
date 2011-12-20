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
alias env='env | sort'
alias gg='git grep -n'

path ()
{
	(IFS=":"; for p in $PATH; do echo $p; done)
}

# Function to add a dir to the end of PATH unless arg2 is "front"
addpath ()
{
	if [ -n $1 ]
	then
		if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)"
		then
			if [ "$2" = "front" ]; then
				PATH=$1:${PATH}
			else
				PATH=${PATH}:$1
			fi
			export PATH
			echo "PATH is now:"
			echo $PATH
		fi
	fi
}

add_ldpath ()
{
	if [ -n $1 ]
	then
		if ! echo $LD_LIBRARY_PATH | /bin/egrep -q "(^|:)$1($|:)"
		then
			if [ "$2" = "front" ]; then
				LD_LIBRARY_PATH=$1:${LD_LIBRARY_PATH}
			else
				LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
			fi
			export LD_LIBRARY_PATH
		fi
	fi
}


rmpath ()
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

# Source the debian supplied user .bashrc file
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi
