#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|file')
DISL_THRESHOLD=1
message=""

while IFS= read line
do
usage=$(echo $line |  awk '{print$6F}' | cut -d % -f1)
partition=$(echo $line |  awk '{print$1F}' | cut -d % -f1)
if [$usage -gt $DISK_THRESHOLD]
then
message+="High disk usage on $partition: $usage\n"
fi
done <<< $DISK_USAGE

echo -e "message: $message"