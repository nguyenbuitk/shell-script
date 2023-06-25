#!/bin/bash
# script renames files based on the file extension.
#   for example: all file end with .txt will be rename to {date}-{filename}.txt

read -p "enter file extension: " EXTENSION
read -p "enter new extension: " NEW_EXT

if [ -z $NEW_EXT ] || [ -z $EXTENSION ]
then exit 1
fi

for FILE in *.$EXTENSION
do
    FILE_WITHOUT_EXT=${FILE%.*}
    NEW_FILE=${FILE_WITHOUT_EXT}.$NEW_EXT
    echo "renaming $FILE to $NEW_FILE"
    mv $FILE $NEW_FILE
done
exit 0
