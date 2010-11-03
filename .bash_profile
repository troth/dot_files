# .bash_profile

#
# $Id: .bash_profile,v 1.1 2004/05/03 15:39:59 roth Exp $
#
# Ted's .bash_profile
#

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -e $HOME/.xenvironment ]; then
	. $HOME/.xenvironment
fi

# Load a local profile if it exists
if [ -f $HOME/.bash_profile_local ]; then
	. $HOME/.bash_profile_local
fi

# Add things that are usually only in root's path.
PATH=$PATH:/usr/sbin:/sbin

# Add all my home paths one at a time so that they are easy to comment out.
PATH=$PATH:$HOME/local/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/local/arm-elf-lpc-newlib/bin
PATH=$HOME/local/emacs/bin:$PATH
#PATH=$PATH:$HOME/local/avr/bin
#PATH=$PATH:$HOME/local/msp430/bin
#PATH=$PATH:/srv/shared/gnuarm/gnuarm/bin
#PATH=$HOME/local/gtk-2.2/bin:$PATH
#PATH=$PATH:$HOME/local/Wine/bin
#PATH=$PATH:$HOME/local/Python-2.3.1/bin

# These are the avr tools that we use at work.
PATH=/usr/local/avr/bin:$PATH
PATH=/usr/local/arm/bin:$PATH

BASH_ENV=$HOME/.bashrc
USERNAME=""

export USERNAME BASH_ENV PATH

MANPATH=$MANPATH:$HOME/man:$HOME/local/man:$HOME/local/avr/man

export PATH MANPATH

MY_LD_LIB_PATH=$HOME/local/lib
#MY_LD_LIB_PATH=$MY_LD_LIB_PATH:$HOME/local/gaim/lib/gaim
#MY_LD_LIB_PATH=$MY_LD_LIB_PATH:$HOME/local/gtk-2.2/lib
#MY_LD_LIB_PATH=$MY_LD_LIB_PATH:$HOME/local/Wine/lib

if [ -n $LD_LIBRARY_PATH ]
then
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MY_LD_LIB_PATH
else
	LD_LIBRARY_PATH=$MY_LD_LIB_PATH
fi
export LD_LIBRARY_PATH

export PYTHONPATH=$HOME/bin/python

export CVS_RSH=ssh

export EDITOR=vim

export JTAG_DEV=/dev/ttyUSB0
export RAPPER_RAP_PORT=/dev/ttyUSB0

export LANG=C
export LC_ALL=C

if [ -e $HOME/bin/setprompt ]
then
	. $HOME/bin/setprompt
fi
