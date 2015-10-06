#!/bin/bash
directory=~/Dropbox/logs/a.sh

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

notebook=$action
shift
text=$@
echo "$text" >> "$directory/$notebook"