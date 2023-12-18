#!/bin/bash

SOURCE_DIR=/tmp/Ebanking_logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [! -d $SOURCE_DIR ] #! denotes inverse and this statments reads the line
then
    echo -e "$R Source Directory: $SOURCE_DIR doesn't exist. $N"
    fi

    FILES_TO_DELETE=$( find $SOURCE_DIR -type f -mtime +7 -name "*.log")

    while IFS= read -r line 
    do

echo "Deleting file: $line"

    done <<< $FILES_TO_DELETE # giving files to delerte o/p to while loop input


