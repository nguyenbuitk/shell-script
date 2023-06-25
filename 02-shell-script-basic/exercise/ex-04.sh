#!/bin/bash

FILE="/etc/shadow"

if [ -e $FILE ]
then
  echo "Shadow passwords are enabled."
  if [ -w $FILE ]
  then
    echo "You have permissions to edit /etc/shadown"
  else
    echo "You do NOT have permissions to edit /etc/shadown"
  fi
fi
