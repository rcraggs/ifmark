#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ifmark condition file > output_file.md" 
    exit
fi


file=$2
cond=$1
sed -e 's/<!--.*CONDITION:'$cond'[[:space:]]\(.*\)-->/\1/g' $file
