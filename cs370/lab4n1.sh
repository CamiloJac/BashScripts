#!/bin/bash
#Camilo Jacomet
#Lab 4 Script 1
set -eo pipefail
counter=0
startTime=$(date +%H:%M)
num='^[0-9]+$'

processes1(){
	while :; do
		ps -eo user --no-headers | sort | uniq -c | sort -k 1 -nr  > log.txt
		sleep $1
		counter=$(($counter+$1))
		if [[ $(($counter % 20)) -eq 0 &&  $(($counter % 60)) -ne 0 ]]; then
			echo Time passed: $counter seconds 
			ps -eo user:11,group --no-headers | sort |  uniq -c | sort -k 1 -nr | head -10 > log20.txt
		elif [ $(($counter % 60)) -eq 0 ]; then
			echo Time passed: $counter seconds 
			cat log20.txt	
			ps -ef | awk -v start="$startTime" '{if ($5 <= "24:00" && $5 >= start) print $0}' | sort -k 5 -r 
		else
			echo Time passed: $counter seconds
		fi
	done
}

processes2(){
	while :; do
		ps -eo user --no-headers | sort | uniq -c | sort -k 1 -nr  > log.txt
		sleep $1
		counter=$(($counter+$1))
		if [[ $(($counter % 20)) -eq 0 &&  $(($counter % 60)) -ne 0  ]]; then
			echo Time passed: $counter seconds 
			ps -eo user:11,group --no-headers | sort |  uniq -c | sort -k 1 -nr | head -n $2 > log20.txt
		elif [ $(($counter % 60)) -eq 0  ]; then
			echo Time passed: $counter seconds 
			cat log20.txt	
			ps -ef | awk -v start="$startTime" '{if ($5 <= "24:00" && $5 >= start) print $0}' | sort -k 5 -r 
		else
			echo Time passed: $counter seconds 
		fi
	done
}

processes3(){
	while :; do
		ps -eo user --no-headers | sort | uniq -c | sort -k 1 -nr  > log.txt
		sleep 10
		counter=$(($counter+10))
		if [[ $(($counter % 20)) -eq 0 &&  $(($counter % 60)) -ne 0 ]]; then
			echo Time passed: $counter seconds 
			ps -eo user:11,group --no-headers | sort |  uniq -c | sort -k 1 -nr | head -10 > log20.txt
		elif [ $(($counter % 60)) -eq 0  ]; then
			echo Time passed: $counter seconds 
			cat log20.txt	
			ps -ef | awk -v start="$startTime" '{if ($5 <= "24:00" && $5 >= start) print $0}' | sort -k 5 -r 
		else
			echo Time passed: $counter seconds
		fi
	done


}
if [ "$#" -gt "2" ] ; then 
	echo "Please enter only 2 arguments at most, make sure those arguments are both positive integers. The first number indicates the number of seconds you'd like the log file to be updated and the second number specifies how many users you'd like to see every 60 seconds."
	exit 1
elif [[ $1 =~ $num && $2 == "" ]]; then	
	processes1 "$@"
elif [[ $1 =~ $num && $2 =~ $num ]]; then
	processes2 "$@"
elif [[ $1 == "" && $2 == "" ]]; then
	processes3
else 
	echo "Please only enter numbers for your two arguments"
	exit 1	
fi
