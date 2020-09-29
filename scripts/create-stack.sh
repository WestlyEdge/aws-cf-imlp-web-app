#!/bin/bash

aws cloudformation create-stack --region us-east-2 --stack-name IMLP-Sandbox-Web-App --template-body file://../templates/imlp-web-app.yaml --no-verify-ssl --capabilities CAPABILITY_IAM \
--parameters \
ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
ParameterKey=EC2ImageId,ParameterValue=ami-00c03f7f7f2ec15c3 \
ParameterKey=Env,ParameterValue=Sandbox \
ParameterKey=LogGroupName,ParameterValue=IMLP-Sandbox-WebApp-Logs \
ParameterKey=LogRetentionDays,ParameterValue=7 \
--tags \
Key=Env,Value=Sandbox