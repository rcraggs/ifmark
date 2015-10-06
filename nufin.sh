#!/bin/bash

directory=~/tmp/nufin-root

if [ ! -d $directory ]
    then 
    mkdir $directory
fi

action=$1
shift

# Show all hidden
if [ "$action" = '-a' ]
    then
    tree $directory    
    exit 
fi

# list files hidden from the current dir down
if [ "$action" = '-l' ]
    then
    tree $directory/$(pwd)  
    exit 
fi

# Hide a file
if [ "$action" = '-h' ]

    FILE=$1
    then
    
    if [ -e "$FILE" ]
    then
        echo "Hiding $(pwd)/$FILE"
        FULL_PATH=$(pwd)/$FILE
        mkdir -p `dirname $directory/$FULL_PATH`
        mv "$FULL_PATH" "$directory/$FULL_PATH"
    fi
    exit 
fi

