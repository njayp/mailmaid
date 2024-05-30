#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <filename> <command> [args...]"
  exit 1
fi

# Extract the filename and the command with its arguments
filename=$1
shift
cmd="$@"

# Loop through all directories containing a main.go file
for path in $(find . -type f -name $filename -exec dirname {} \; | sort -u); do
  # Extract the directory name
  dir=$(basename "$path")

  # Replace placeholders in the command with actual values
  actual_cmd=$(echo "$cmd" | sed "s|{{PATH}}|$path/$filename|g" | sed "s|{{DIR}}|$dir|g")
  echo $actual_cmd

  # Run the specified command
  eval "$actual_cmd"
done
