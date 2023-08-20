#!/bin/bash

echo THIS SCRIPT WILL HANDLE 90% BRANCH MANAGEMENT

#echo Enter either a main or master branch
#read mbr

#echo Creating the $mbr branch

#git branch $mbr
echo INITIALISING A LOCAL REPO
git init

echo Adding a readme file to the master branch
touch README.md
git add README.md
git commit -m"comitting README.md file"

git log
sleep 7

clear

echo CREATING DOWNSTREAMS

echo Your current workig branch is:
git branch

sleep 2

echo Enter master downstream branch
read sbr

echo Creating the $sbr branch

git branch $sbr 

git switch $sbr

echo Your current working branch is:

git branch

sleep 2

echo Enter $sbr downstream branch
read dbr

echo Creating the $dbr branch

git branch $dbr

git switch $dbr

echo Your current working branch is 

git branch

sleep 2

echo branches creation is succesful.

echo Creating and Editing a file in $dbr branch

echo Enter file name
read file

vi $file

echo Create $file successfully
sleep 2

echo STAGING AND COMMINTING CHANGES

git add $file

git status

echo "To commit the changes, Enter a commit message"
read commitmsg

git commit -m"$commitmsg"

git log
 sleep 3s

echo WILL YOU LIKE TO MERGE COMMIT TO $sbr branch yes/no
read opt1

if (( $opt1 == yes )) then
	
       git switch $sbr
       echo enter the merge commit message
       read mmsg
       git merge -m"$mmsg" $dbr

       git log

       echo Merging to $sbr successful
       sleep 2s

fi

echo WILL YOU LIKE TO MERGE COMMIT TO master branch yes/no
read opt2

if (( $opt2 == yes )) then

       git switch $mbr
       echo enter the merge commit message
       read mmsg1
       git merge -m"$mmsg1" $sbr

       git log
       echo Merging to $mbr successful
       sleep 2s
fi

echo WILL YOU LIKE TO CREATE A TAG yes/no
read opt3

if (( $opt3 == yes )) then

	echo Enter Tag name
	read tagn
        git tag $tagn

	echo $tagn successfully created
fi

echo ENJOYED MY SCRIPT










