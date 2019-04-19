#!/bin/bash

# Note: For this to work the pattern must be passed as a string, especially when using regular expressions or a wildcard in the pattern
# because the wildcard is expanded before the script so it doesn't work with two variables. The only way this works is when the pattern is passed as a string or
# if the path and the pattern were one argument( but that wasn't the description of the lab) so in this case I solved it with 2 parameters.
if [ -d $1 ] || [ -f $1] && [ "$2" !=  "" ]; then
	cd $1
	ls -l $2 | awk '{print $9}' | while read line;
					do
						wc -w $line
					done | sort -k 1 -n -r 
else
    echo "$1 is not valid, or $2 may be invalid. Make Sure the first argument is a proper path. Make sure the second argument is the number of lines you'd like to see."
    exit 1
fi


