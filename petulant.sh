#!/bin/bash
if [ "$1" = "!" ]; then
	FORCE=" "
else
	echo Pass "!" as an argument to force overwriting at the destination
	FORCE="i"
fi
cp -v$FORCE ./* ~/bin
chmod +x ~/bin/*.sh