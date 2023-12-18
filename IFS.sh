#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [! -f $file] #! denotes inverse and this condition checkes whether directory exists or not
then
    echo -e "$R Source Directory: $SOURCE_DIR doesn't exist. $N"
    fi

    while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path 
    do
    echo "username is $username"
    echo "userid is $user_id"
    echo "groudp id is $group_id"

    done < $file