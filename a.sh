#!/bin/bash
directory=~/Dropbox/logs/a.sh

if [ "$#" -eq 0 ]; then
    echo "Usage"
    echo "a.sh -p text  - apprend text to previous notebook"
    echo "a.sh notebook text  - apprend text to notebook"
    echo "a.sh -l  - list notebooks"
    echo "a.sh -e notebook - edit notebook"
    echo "a.sh -v notebook - view notebook"
    exit
fi

if [ ! -d $directory ]
    then 
    mkdir $directory
fi

action=$1

# List notebooks
if [ "$action" = '-l' ]
    then
    ls -l $directory
    exit 
fi

# view notebook
if [ "$action" = '-v' ]
    then
    shift
    notebook=$1
    cat "$directory/$notebook"
    exit 
fi

# view notebook
if [ "$action" = '-e' ]
    then
    shift
    notebook=$1
    subl "$directory/$notebook"
    exit 
fi

# view notebook
if [ "$action" = '-p' ]
    then
    shift
    notebook=$(<"$directory/.ash-prev")
    text=$@
    echo "$text" >> "$directory/$notebook"
    exit 
fi


notebook=$action
shift
text=$@
echo "$text" >> "$directory/$notebook"
echo "$notebook" > "$directory/.ash-prev"