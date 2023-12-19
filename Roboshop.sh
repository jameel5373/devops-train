#!/bin/bash

AMI=ami-03265a0778a880afb
SG_ID=sg-04e5362f0310fc7bf
INSTANCES=("mongodb" "mysql" "redis" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    echo "Instancetype is $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
    INSTANCE_TYPE="t3.small"
    else
    INSTANCE_TYPE="t2.micro"
    fi

   IP_ADDRESS=$(aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type $INSTANCE_TYPE --security-group-ids sg-04e5362f0310fc7bf --tag-specifications "ResourceType=instance,Tags=[{Key=webserver,Value=$i}]" --query 'Instance[0].PrivateIpAddress' --output text)

   echo "$i: $IP_ADDRESS"

   
done

