#!/bin/bash

aws cloudformation validate-template --template-body file://../templates/imlp-web-app.yaml  --region us-east-2 --no-verify-ssl