#!/bin/bash

for file in *.imageset ;
  do cd "$file" && crusher.sh && cd ..;
done