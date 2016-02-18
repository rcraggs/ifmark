#!/bin/bash

ADVERT_FOLDER="/var/cscampus/ForStudents/degree-struct/2016"
USER="rc340"

# Create a random dir to move files into first
dir=`mktemp -d`

for f in "$@" ### loop, for each dropped folder
do
    if [ -f "$f" ]; then ## this item is a directory

      # Move the file to the temp directory
  		cp "$f" $dir

      # Get the filename of the moved file then get its full new path
      filename=`basename "$f"`
      spacelessname="${filename//[[:space:]]}"
      newpath="$dir/$spacelessname"

      mv "$dir/$filename" $newpath

      chmod o+r $newpath # make it public readable
      scp $newpath $USER@nyx.mcs.le.ac.uk:$ADVERT_FOLDER

      echo $spacelessname
    fi
done

# Set everything in that directory to be public readable
ssh $USER@nyx.mcs.le.ac.uk "chmod o+r $ADVERT_FOLDER/*"
