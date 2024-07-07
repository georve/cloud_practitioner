#!/bin/bash

BUCKET_NAME=bucketpulblicque

bucket= aws s3api create-bucket --bucket $BUCKET_NAME --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

aws s3 website s3://$BUCKET_NAME/ --index-document index.html

aws s3 cp /home/ec2-user/sysops-activity-files/ s3://$BUCKET_NAME/ --recursive --acl public-read

