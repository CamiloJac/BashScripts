#!/bin/bash

mkdir -p ~/meals/breakfast ~/meals/lunch/soup ~/meals/lunch/dessert ~/meals/dinner/appetizer ~/meals/dinner/dish

cat > ~/meals/breakfast/favorites.txt <<- EOF
	Eggs Benedict
	Crepes
	French Toast
	Toast and Jam
	Bagel and Cream Cheese
	Eggs and Sausage with Toast
EOF

cat > ~/meals/lunch/soup/soups.txt <<- EOF
	Chicken Tortilla Soup
	Clam Chowder
	Seafood Bisque
	Chicken Noodle Soup
	French Onion Soup
	Split Pea Soup
EOF

cat > ~/meals/lunch/dessert/cookies.txt <<- EOF
	Snickerdoodle
	Chocolate Chip
	Oatmeal
	White Chip Macademia Nut
	Peanut Butter
EOF

mv ~/meals/dinner/dish ~/meals/lunch

cat > ~/meals/dinner/appetizer/catalog.txt <<- EOF
	Catalog To be copied
EOF

cp ~/meals/dinner/appetizer/catalog.txt ~/meals/lunch/catalog.txt 
cp -r ~/meals/dinner/appetizer ~/meals/lunch #this is to copy the directory recursively
cp ~/meals/lunch/soup/soups.txt ~/meals/

# Step 4
ls -lR ~/meals/

ls -lhs .
ls -l . | awk '{if($9 == "meals"){ printf "Size is: %d bytes\n", $5}}'
stat . | grep Size | awk '{ printf "Size is: %d\n", $2; }'

# Step 5
tail -3 ~/meals/lunch/soup/soups.txt

# Step 6
sort -d ~/meals/lunch/dessert/cookies.txt
cat ~/meals/lunch/dessert/cookies.txt | sort -d

# Step 7
chmod 600 ~/meals/soups.txt

# Step 8 
find ~/meals/ -type d -name '[s]*' #find the directories that start with s under meals
find ~/meals/ -type f -name '[s]*' #find the files that start with s under the meals hierarchy





