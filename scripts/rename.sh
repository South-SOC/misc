#!/bin/bash

# https://stackoverflow.com/questions/46264427/rename-file-while-keeping-the-extension-in-linux

#End of line character
IFS=$'\n'

#Numbering for the files starts
COUNTER=0

# Works in the current directory
for i in $(ls -1)
do 
	#Get filetype/extension
	ext=${i##*.}
	#Rename file (keep extension)
	mv $i pic_$COUNTER.$ext
	#Increase counter
    	COUNTER=$[COUNTER + 1]
done
