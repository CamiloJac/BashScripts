#!/bin/bash
# Camilo Jacomet
# Script 1 lab 3
if [ -d $1 ] || [ -f $1] && [ "$2" != "" ]; then
	find $1 -ls -perm -u+rw | awk '{print $11}' | while read line 
       							do
								cat $line | head -n $2
							done	
else
    echo "$1 is not valid, or $2 may be invalid. Make Sure the first argument is a proper path. Make sure the second argument is the number of lines you'd like to see."
    exit 1
fi
