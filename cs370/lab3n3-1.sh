#!/bin/bash

mkdir -p dictFiles

if [ -f $1 ]; then
	cat $1 | tr ' ' '\n' | awk '/^[a-zA-Z]/ { print tolower($0) > "dictFiles/"substr(tolower($0),0,1)".txt" }' 
else
    echo "$1 is not a valid file."
    exit 1
fi

for file in ./dictFiles/*.txt; do
	sort $file -o $file
done
