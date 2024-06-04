#!/bin/env bash

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null
then
  echo "Error: ImageMagick is not installed. Please install it before running this script."
  exit 1
fi

# Loop through all SVG files in the current directory
for file in *.svg
do
  # Create a new filename with "_inverted" suffix
  output_file="${file%.*}_inverted.svg"

  # Invert colors (channel RGB avoids affecting transparency)
  magick "$file" -channel RGB -negate "$output_file"
  echo "Inverted colors of $file to $output_file"
done
