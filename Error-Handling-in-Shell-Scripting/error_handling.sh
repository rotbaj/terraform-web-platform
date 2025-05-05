#!/bin/bash

# Function to create S3 buckets for different departments
create_s3_buckets() {
    echo "Starting bucket creation..."

    company="datawise"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    aws_cli="/c/Program Files/Amazon/AWSCLIV2/aws.exe"
    suffix=$(date +%s)  # Add current timestamp to make bucket names unique

    for department in "${departments[@]}"; do
        bucket_name="${company}-${department,,}-data-bucket-${suffix}"  # lowercase + unique
        echo "Processing bucket: $bucket_name"

        # Check if the bucket already exists
        "$aws_cli" s3api head-bucket --bucket "$bucket_name" --region eu-west-2 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Create S3 bucket
            "$aws_cli" s3api create-bucket --bucket "$bucket_name" --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2 2>&1
            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
        echo ""
    done
}

# Call the function
create_s3_buckets
