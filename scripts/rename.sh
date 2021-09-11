#!/bin/bash

# Default values
#Numbering for the files starts
COUNTER=0

#End of line character
IFS=$'\n'

# Working Directory
W_DIR=$(pwd)

# File renaming base name
BASE="file"

function print_help () {
        echo -e "Usage: $0 [-h]"
        echo -e "\t-h\t\tPrint this help"
        echo -e "\t-c\t\tStarting file numbers"
        echo -e "\t-d\t\tDirectory to search for files"
        echo -e "\t-i\t\tInclude original filename in the new filename"
}

# Parsing options
# https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/

while getopts ":h:c:d:" opt; do
  case ${opt} in
    h )
      print_help
      exit 0
      ;;
    c )
      COUNTER=$OPTARG
      echo "Counter: $COUNTER"
      ;;
    d )
      W_DIR=$OPTARG
      echo "Working Directory: $W_DIR"
      ;;
    \? )
      print_help
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# https://stackoverflow.com/questions/46264427/rename-file-while-keeping-the-extension-in-linux

# Works in the current directory
for i in $(find $W_DIR -maxdepth 1 ! -type d)
do 
	#Get filetype/extension
  EXTENSION=${i##*.}
  #	#Rename file (keep extension)
  echo "mv ${i} ${W_DIR}${BASE}_${COUNTER}.${EXTENSION}"
  #Increase counter
  COUNTER=$[COUNTER + 1]
done
