#!/bin/bash
echo ======================
echo Copying Configurations
echo ======================

cp -v setup/slate ~/.slate
cp -v setup/DefaultKeyBinding.dict ~/Library/KeyBindings/
cp -v setup/init.el ~/.emacs.d/
