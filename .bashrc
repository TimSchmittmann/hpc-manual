# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200
export PYTHONHASHSEED=0

PARTITION=${HOSTNAME:6:2}

if [ "$PARTITION" = "ml" ]; then
  export IN_ML_PARTITION="TRUE"
  export PATH=$PATH:/home/s7740678/.local/bin
  # echo "Architecture: ppc64"

  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  export PATH="/beegfs/ws/1/s7740678-condahome_01/ppc64/git:$PATH"
  source /beegfs/ws/1/s7740678-condahome_01/ppc64/set_conda.sh
else
  # echo "Architecture: x86_64"
  export PATH="/beegfs/ws/1/s7740678-condahome_01/x86_64/git:$PATH"
  source /beegfs/ws/1/s7740678-condahome_01/x86_64/set_conda.sh
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$'