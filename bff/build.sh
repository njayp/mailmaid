#!/bin/bash
filename=main.go

# Find all directories containing filename
directories=$(find . -type f -name $filename -exec dirname {} \;)

# Loop through each directory
for dir in $directories; do
  # Extract the directory name
  dirname=$(basename $dir)
  
  # Build the Go program with the output named after the directory
  go build -o output/bin/$dirname $dir/$filename
done