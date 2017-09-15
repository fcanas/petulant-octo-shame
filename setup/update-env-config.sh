#!/bin/bash
echo ======================
echo Copying Configurations
echo ======================

# Not using slate anymore
# cp -v setup/slate ~/.slate
mkdir -p ~/bin/
mkdir -p ~/Library/KeyBindings/ && cp -v setup/DefaultKeyBinding.dict ~/Library/KeyBindings/
# Not using emacs at the moment
# cp -v setup/init.el ~/.emacs.d/
