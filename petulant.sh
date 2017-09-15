#!/bin/bash
if [ "$1" = "!" ]; then
	FORCE=" "
else
	echo Pass "!" as an argument to force overwriting at the destination
	FORCE="i"
fi

git config --global core.editor "/usr/local/bin/emacs -nw"

cp -v$FORCE ./*.sh ~/bin
chmod +x ~/bin/*.sh

cp -v$FORCE ./*.swift ~/bin
chmod +x ~/bin/*.swift

cp -v$FORCE ./stree ~/bin/stree
chmod +x ~/bin/stree

cp -v$FORCE ./fuxcode ~/bin/fuxcode
chmod +x ~/bin/fuxcode

for each in setup/*.sh; do bash $each ; done

for each in ./dot/*; do dest=${each/.\/dot\//$HOME\/.}; cp -v$FORCE $each $dest; done
