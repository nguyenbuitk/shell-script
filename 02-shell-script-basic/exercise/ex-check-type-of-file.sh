#!/bin/bash
# Script check location is regular file, a directory, or other type of file

for FILE in $@
do
  if [ -f "$FILE" ]
  then
    echo "$FILE is a regular file."
  elif [ -d "$FILE" ]
  then
    echo "$FILE is a directory."
  else
    echo "$FILE is something other than a regular file or directory."
  fi

  ls -l $FILE
done
