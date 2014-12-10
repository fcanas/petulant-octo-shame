#!/bin/bash
# Count lines of code in C / Objective-C / Swift projects
#
# Optional argument : the root directory to evaluete. 
# Defatuls to current directory
find ${1:-.} "(" -name "*.h" -or -name "*.m" -or -name "*.mm" -or -name "*.hpp" -or -name "*.cpp"  -or  -name "*.c" -or  -name "*.swift" -or -name "*.cc" ")" -print0 | xargs -0 wc -l