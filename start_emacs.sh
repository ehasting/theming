#!/bin/sh

export ALTERNATE_EDITOR=""
args="$@"

if [ -z "${args}" ]; then
	echo "Filename not specified"
	args="newfile"	
fi
emacsclient "${args}"
if [ $? -eq 2 ]; then
	echo "Daemon not running, starting up"
    emacs --daemon -D $DISPLAY
    emacsclient "${args}"
fi
