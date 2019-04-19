#!/bin/bash

month=$(date --date="yesterday" +%b)
yesterday=$(date --date="yesterday" +%d)

#Step 1
echo -e "Step 1 commands\n"
who
who -q
who -a
who | wc -l #List the number of connections to nix, this includes users that have connected w 2 terminals
who | awk '{print $1}' | uniq 
who | awk '{print $1}' | uniq | wc -l

#Step 2
echo -e "\n\nStep 2 commands\n"
last | awk -v month="$month" -v yesterday="$yesterday" '{
    if($5==month && $6==yesterday && $7 < "14:00"){
        printf "%s\n",$0
    }
}' | sort -k 7 | head -n 7

#Step 3
#Make sure you are connected to nix1.cs.cwu.edu for the following to work
echo -e "\n\nStep 3 commands\n"
echo $HOSTNAME

#Step 4
echo -e "\n\nStep 4 commands\n"
ping -c 3 nix1.cs.cwu.edu

#Step 5
echo -e "\n\nStep 5 commands\n"
clear

#Step 6
echo -e "\n\nStep 6 commands\n"
dig +short www.cwu.edu
dig +short www.google.com

#Step 7
echo -e "\n\nStep 7 commands\n"
date

#Step 8
echo -e "\n\nStep8 commands\n"
uptime
