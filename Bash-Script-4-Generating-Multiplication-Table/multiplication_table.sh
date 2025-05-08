#!/bin/bash

# Prompt the user for a number
read -p "Enter a number to generate its multiplication table: " number

# Validate that input is a number
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
fi

# Ask the user for full or partial table
read -p "Do you want the full table (1-10) or a partial table? (Enter 'full' or 'partial'): " choice

if [[ "$choice" == "full" ]]; then
  echo "Multiplication Table for $number (1 to 10):"
  for (( i=1; i<=10; i++ ))
  do
    echo "$number x $i = $(( number * i ))"
  done

elif [[ "$choice" == "partial" ]]; then
  # Get the range from the user
  read -p "Enter the start of the range: " start
  read -p "Enter the end of the range: " end

  # Validate range input
  if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]]; then
    echo "Invalid range. Please enter positive numbers for start and end."
    exit 1
  fi

  if (( start > end )); then
    echo "Invalid range: start must be less than or equal to end."
    exit 1
  fi

  echo "Multiplication Table for $number (from $start to $end):"
  for (( i=start; i<=end; i++ ))
  do
    echo "$number x $i = $(( number * i ))"
  done

else
  echo "Invalid choice. Please enter 'full' or 'partial'."
  exit 1
fi
