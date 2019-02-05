#!/bin/bash

if [ "$#" -eq "0" ];then
	echo "you must enter a path name"
	exit 1
elif [ -d $1 ]; then
	ls -ltR $1 > filesSortedBasedOnTime.txt
	ls -lSR $1 > filesSortedBasedOnSize.txt
else
	echo "please enter a valid path"
    	exit 1
fi


