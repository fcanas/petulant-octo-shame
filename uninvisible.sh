#!/bin/bash
for file in *.imageset ;
  do cd "$file" && alphaOff.sh && cd ..;
done
