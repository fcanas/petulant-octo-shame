#!/bin/bash
echo ======================
echo Copying Configurations
echo ======================

mkdir -p ~/bin/
mkdir -p ~/Library/KeyBindings/ && cp -v setup/DefaultKeyBinding.dict ~/Library/KeyBindings/
cp -vR 'setup/Sort lines.workflow' ~/Library/Services/

# Not using emacs at the moment
# cp -v setup/init.el ~/.emacs.d/
