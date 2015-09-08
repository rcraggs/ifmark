#!/bin/bash
file=$2
cond=$1
sed -e 's/<!--.*CONDITION:'$cond'[[:space:]]\(.*\)-->/\1/g' $file