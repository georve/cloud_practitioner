#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo
echo "Running execute.sh on "$DATE
echo

BUCKET_NAME=flowlog9839474

bucketinstance= aws s3api create-bucket --bucket $BUCKET_NAME --region 'us-west-2' --create-bucket-configuration LocationConstraint='us-west-2'