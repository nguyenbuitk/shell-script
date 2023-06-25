#!/bin/bash

FILE=$1
if [ -f $FILE ]
then
	echo "this is file"
	exit 0
elif [ -d $FILE ]
then
	echo "this is directory"
	exit 1
else
	echo "this is not file or directory"
	exit 2
fi

ls -l $FILE
