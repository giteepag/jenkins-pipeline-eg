#!/bin/bash

api_stack_name="LINUX-EC2-Deploy"
api_region="us-east-1"

type_formation=""

if ! aws cloudformation describe-stacks --region $api_region --stack-name $api_stack_name ; then
    echo "1"
    type_formation='create-stack'
else
    type_formation='update-stack'
fi

file='\deploy\LINUX-EC2.yaml'

echo "======================================== Creating/Updating the stack "
eval "aws --region $api_region cloudformation $type_formation --stack-name $api_stack_name --template-body 'file://$file'"
echo "======================================== Verifying the stack "
exec aws --region $api_region cloudformation describe-stacks --stack-name $api_stack_name
