#!/bin/bash

# check that exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Get the environment from the first argument
ENVIRONMENT=$1

# Execute based on the environment
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Ìø° Running script for Local Environment..."

elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Ì∑™ Running script for Testing Environment..."

elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Ì∫Ä Running script for Production Environment..."

else
  echo "‚ùå Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi

