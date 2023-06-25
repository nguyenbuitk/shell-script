#!/bin/bash

function file_count() {
   local NUMBER_OF_FILES=$(ls $1 | wc -l)
   echo "$NUMBER_OF_FILES"
}

function display() {
    echo $1:
    file_count $1
}

display /var
display /etc
display /usr/bin
