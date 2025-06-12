#!/bin/bash

# Load environment variables (you can set these in a .env file and source it)
AWS_REGION=${AWS_REGION:-"us-east-1"}
AMI_ID=${AMI_ID:-"ami-0c02fb55956c7d316"}  # Amazon Linux 2
INSTANCE_TYPE=${INSTANCE_TYPE:-"t2.micro"}

# Hardcoded resource names (S3 bucket must be unique globally)
EC2_INSTANCE_NAME="Datawise-solution-Ec2"
S3_BUCKET_NAME="datawisesolution-sandradevops-s3-$(date +%s)"

# Function to print error and exit
error_exit() {
    echo "[ERROR] $1"
    exit 1
}

# ✅ FIXED Function to create S3 bucket
create_s3_bucket() {
    echo "[INFO] Creating S3 bucket: $S3_BUCKET_NAME in region $AWS_REGION"

    if [ "$AWS_REGION" = "us-east-1" ]; then
        aws s3api create-bucket \
            --bucket "$S3_BUCKET_NAME" \
            --region "$AWS_REGION"
    else
        aws s3api create-bucket \
            --bucket "$S3_BUCKET_NAME" \
            --region "$AWS_REGION" \
            --create-bucket-configuration LocationConstraint="$AWS_REGION"
    fi

    if [ $? -ne 0 ]; then
        error_exit "Failed to create S3 bucket: $S3_BUCKET_NAME. It may already exist or the name is not unique."
    fi

    echo "[SUCCESS] S3 bucket created: $S3_BUCKET_NAME"
}

# Function to create EC2 instance
create_ec2_instance() {
    echo "[INFO] Launching EC2 instance: $EC2_INSTANCE_NAME"

    instance_params=(
        --image-id "$AMI_ID"
        --count 1
        --instance-type "$INSTANCE_TYPE"
        --region "$AWS_REGION"
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$EC2_INSTANCE_NAME}]"
    )

    instance_id=$(aws ec2 run-instances "${instance_params[@]}" \
        --query 'Instances[0].InstanceId' --output text 2>/dev/null)

    if [ -z "$instance_id" ]; then
        error_exit "Failed to launch EC2 instance"
    fi

    echo "[SUCCESS] EC2 Instance launched: $instance_id"
}

# Main function
main() {
    echo "[START] AWS Resource Setup Script"
    create_s3_bucket
    create_ec2_instance
    echo "[DONE] All resources created successfully"
}

# Run the main function
main

