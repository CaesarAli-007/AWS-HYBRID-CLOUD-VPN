#!/bin/bash

set -e

# Variables
AWS_REGION="us-east-1"  # Change this to your preferred AWS region
STACK_NAME="HybridCloudVPNStack"

# Deploy CloudFormation stack for VPC, Security Groups, and EC2
aws cloudformation deploy \
  --region $AWS_REGION \
  --stack-name $STACK_NAME \
  --template-file infrastructure/cloudformation.yml \
  --capabilities CAPABILITY_NAMED_IAM

# Fetch EC2 Instance ID and Public IP
INSTANCE_ID=$(aws cloudformation describe-stacks \
  --region $AWS_REGION \
  --stack-name $STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='EC2InstanceId'].OutputValue" \
  --output text)
PUBLIC_IP=$(aws ec2 describe-instances \
  --region $AWS_REGION \
  --instance-ids $INSTANCE_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

# Display connection details
echo "Deployment complete!"
echo "Connect to your EC2 instance using: ssh ec2-user@$PUBLIC_IP"
echo "To complete OpenVPN setup, run: ./openvpn_setup.sh on the instance."
