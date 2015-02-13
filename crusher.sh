#!/bin/bash
for file in *.png ;
	do pngcrush -brute "$file" "${file%.png}-crushed.png" && mv "${file%.png}-crushed.png" "$file" ; 
done