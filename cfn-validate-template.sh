#/bin/bash

file='/var/lib/jenkins/workspace/jenkins-test/deploy/LINUX-EC2.yaml'

#Check if templates have syntax error
aws cloudformation validate-template --template-body "file://$file"

if($? --ne 0)
then
  echo 'Template sytax is validated successfully'
 elif
  echo 'Template has sytax errors!'
fi

