#!/bin/bash
# script renames files based on the file extension.
#   for example: all file end with .txt will be rename to {date}-{filename}.txt

DATE=$(date +%F)
read -p "enter file extension: " EXTENSION
read -p "enter prefix default is \"$DATE\": " PREFIX

if [ -z $PREFIX ]
then PREFIX=$DATE
fi

for FILE in *.$EXTENSION
do
    echo "renaming $FILE to $DATE-$FILE"
    mv $FILE $DATE-$FILE
done
