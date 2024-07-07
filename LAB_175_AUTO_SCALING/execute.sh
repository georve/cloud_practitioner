#!/bin/bash

KEYNAME=$1
AMIID=$2
HTTPACCESS=$3
SUBNETID=$4

instanceId= aws ec2 run-instances --key-name $KEYNAME --instance-type t3.micro --image-id $AMIID --user-data file:///home/ec2-user/UserData.txt --security-group-ids $HTTPACCESS --subnet-id $SUBNETID --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]' --output text --query 'Instances[*].InstanceId'

status=  aws ec2 wait instance-running --instance-ids $instanceId

dns_name= aws ec2 describe-instances --instance-id $instanceId --query 'Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicDnsName'

ami_name= aws ec2 create-image --name WebServerAMI --instance-id $instanceId
