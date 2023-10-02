#!/bin/bash

# Function to check if a number is a positive integer
is_positive_integer() {
  re='^[0-9]+$'
  if [[ $1 =~ $re ]] && [ $1 -gt 0 ]; then
    return 0
  else
    return 1
  fi
}

# Check the number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <number of rows> <number of columns>"
  exit 1
fi

# Validate the input parameters
if ! is_positive_integer "$1" || ! is_positive_integer "$2"; then
  echo "Both row and column must be positive integers."
  exit 1
fi

# Assign input parameters to variables
rows="$1"
columns="$2"

# Calculate the maximum length of a cell
max_length=$((2 * ${#rows} + 3))

# Print the multiplication table
for ((i = 1; i <= rows; i++)); do
  for ((j = 1; j <= columns; j++)); do
    product=$((i * j))
    printf "%d*%d=%d" "$i" "$j" "$product"
    
    # Calculate the number of spaces to align the result
    num_spaces=$((max_length - ${#product}))
    
    # Print the required number of spaces
    for ((k = 0; k < num_spaces; k++)); do
      printf " "
    done
    
    if [ $j -ne $columns ]; then
      printf " "  # Add a space between columns except for the last column
    fi
  done
  echo
done


