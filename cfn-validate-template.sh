#/bin/bash

api_region="us-east-1"
file='/var/lib/jenkins/workspace/jenkins-test/deploy/LINUX-EC2.yaml'

#Check if templates have syntax error
aws cloudformation --region $api_region validate-template --template-body "file://$file"

if($? -ne 0)
then
  echo 'Template sytax is validated successfully'
 else
  echo 'Template has sytax errors!'
fi

