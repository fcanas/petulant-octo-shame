#!/bin/bash

for file in *.png ;
	do convert "$file" -alpha off "${file%.png}-no-alpha.png" && mv "${file%.png}-no-alpha.png" "$file" ; 
done