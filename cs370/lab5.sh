#camilo jacomet
#lab 5
#!/bin/bash
set -eo pipefail
if [[ ( -f $1  &&  -f $2) && ( "$3" != "" ) ]]; then
	cat $1 | tr ' ' '\n' | tr -d '.' | tr -d ',' | sed '/^\s*$/d' | grep -Fvixf $2 | sort | uniq -c | sort -rn | head -$3
else
	echo "The first argument must be the file from which you're looking for typos. The second argument must be the dictionary to check for typos. The third argument must be the number of lines you'd like printed."
	exit 1
fi

	
