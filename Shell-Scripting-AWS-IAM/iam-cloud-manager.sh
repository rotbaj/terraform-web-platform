#!/bin/bash

PROFILE="cassie"

# Define IAM User Names Array
IAM_USER_NAMES=("alice" "bob" "charlie" "diana" "eric")  # Replace with actual usernames

create_iam_users() {
    echo "Creating IAM users..."
    for USER in "${IAM_USER_NAMES[@]}"; do
        if aws iam get-user --user-name "$USER" --profile "$PROFILE" >/dev/null 2>&1; then
            echo "User $USER already exists."
        else
            aws iam create-user --user-name "$USER" --profile "$PROFILE" && echo "Created user: $USER" || echo "Failed to create user: $USER"
        fi
    done
    echo ""
}

create_cloudops_admin_group() {
    echo "Setting up 'cloudOps-admin' group..."
    if ! aws iam get-group --group-name "cloudOps-admin" --profile "$PROFILE" >/dev/null 2>&1; then
        aws iam create-group --group-name "cloudOps-admin" --profile "$PROFILE" && echo "Group created: cloudOps-admin"
    else
        echo "Group already exists: cloudOps-admin"
    fi

    aws iam attach-group-policy \
        --group-name "cloudOps-admin" \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess \
        --profile "$PROFILE" \
        && echo "Policy attached to group." || echo "Failed to attach policy."

    echo ""
}

add_users_to_cloudops_admin_group() {
    echo "Adding users to 'cloudOps-admin' group..."
    for USER in "${IAM_USER_NAMES[@]}"; do
        aws iam add-user-to-group \
            --user-name "$USER" \
            --group-name "cloudOps-admin" \
            --profile "$PROFILE" \
            && echo "Added $USER to group." || echo "Failed to add $USER."
    done
    echo ""
}

main() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI not installed or not in PATH."
        exit 1
    fi

    create_iam_users
    create_cloudops_admin_group
    add_users_to_cloudops_admin_group

    echo "IAM setup complete."
}

main
exit 0
