#!/bin/bash

# Camilo Jacomet
# CS 370 - Spring 2018
# Lab 1
# April 10, 2018

RED='\033[0;31m'
NC='\033[0m'
os=$(cat /etc/os-release | grep ^ID | cut -c4-)


# mkdir commands
#mkdir lab1
mkdir -p lab1/dir1/dir2/dir3 lab1/dir1/dir4/dir5

# rmdir commands
rmdir lab1/dir1/dir4/dir5

# cd commands
echo -e "${RED}cd commands${NC}"
cd /var/log
cd ~/lab1
cd ~/
# pwd command
echo -e "${RED}pwd command${NC}"
pwd

# ls commands
echo -e "${RED}ls commands${NC}"
ls | head
ls /etc/ | head
ls -la / | head
ls -laRt / |head

# cat file creation commands
echo -e "${RED}cat file creation commands${NC}"
cat > lab1/file1.txt <<- EOF
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1
	This is file 1

EOF

cat > lab1/file2.txt <<- EOF
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
	This is file 2
EOF

# cat concatenation of two files
cat lab1/file1.txt lab1/file2.txt > file3.txt

# more/less commands
echo -e "${RED}more /etc/passwd${NC}"
more /etc/passwd	#could also be done with ls | more /etc/passwd
echo -e "${RED}less /etc/passwd${NC}"
less /etc/passwd

# Creating the two test files that will be used to copy from one directory to another
echo -e "${RED}cat > lab1/dir1/dir2/filetocopy.txt${NC}"
cat > lab1/dir1/dir2/filetocopy.txt <<- EOF
	This is the file that will be copied from dir1/dir2 to dir1/dir4.
EOF

echo -e "${RED}cat > lab1/dir1/dir4/filetocopyv.txt${NC}"
cat > lab1/dir1/dir4/filetocopyv.txt <<- EOF 
	This is the file that will be copied using verbose mode from dir1/dir4 to dir1/dir2
EOF

# cp commands
cp lab1/dir1/dir2/filetocopy.txt lab1/dir1/dir4/
cp -v lab1/dir1/dir4/filetocopyv.txt lab1/dir1/dir2

# mv commands
mv -t ~/ lab1/file1.txt lab1/file2.txt
mv file3.txt lab1/dir1/dir2/blabla.txt
#mv lab1/dir1/dir2/blabla.txt ~/file3.txt

#rm commands
cat > fileToRemove.txt <<- EOF
	file to remove with rm commands
EOF
rm fileToRemove.txt
mkdir -p ~/lab1/dir8/dir9
rm -ri ~/lab1/dir8/


# rename commands
echo -e "${RED}cat > lab1/dir1/dir4/filetocopyv.txt${NC}"
cat > cppFile.cpp <<- EOF 
	This is the file that will be copied using verbose mode from dir1/dir4 to dir1/dir2
EOF

echo -e "${RED}cat > lab1/dir1/dir4/filetocopyv.txt${NC}"
cat > cFile.c <<- EOF 
	This is the file that will be copied using verbose mode from dir1/dir4 to dir1/dir2
EOF

case $os in
	"fedora")
		echo this is fedora
		rename -v .c .c++ *.c
		rename -v .cpp .c++ *.cpp
		;;
	"debian")
		echo this is debian
		rename -v 's/(\.c$|\.cpp$)/.c++/' *
		;;
esac

# w commands
# assuming you're connected to nix1 machine, if not 
# ssh user@nix1.cs.cwu.edu
# enter password
w
w -h


# last commands
last
last -n3

# date commands
date
date +%D
date +%m/%d
date +%H%:z

# sort commands
sort ~/lab1/dir1/dir2/blabla.txt
sort -r ~/lab1/dir1/dir2/blabla.txt
sort -u ~/lab1/dir1/dir2/blabla.txt
cat > point.txt <<- EOF 
	camilo jacomet 5
	camilo jacomet 6
	camilo jacomet 10
	camilo jacomet 3
	camilo jacomet 50
EOF
sort -k 3,3 -nr point.txt


# head commands
head ~/lab1/dir1/dir2/blabla.txt
head --bytes=20 ~/lab1/dir1/dir2/blabla.txt
head --lines=-2 ~/lab1/dir1/dir2/blabla.txt

# tail commands
tail ~/lab1/dir1/dir2/blabla.txt
tail --bytes=10 ~/lab1/dir1/dir2/blabla.txt
tail --lines=5 ~/lab1/dir1/dir2/blabla.txt

# ln commands
ln -s /etc/passwd password_info

# chmod commands
cat > blabla.sh <<- EOF 
	blablabla
EOF
chmod +x blabla.sh
chmod 755 blabla.sh

# du commands
du -b .
du -k .
du -m .
du -h .

# df commands 
df -h .

