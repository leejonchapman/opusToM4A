#!/bin/bash

input_directory="/Volumes/x"
output_directory="/Volumes/y"

for file in "$input_directory"/*.opus; do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename_noext="${filename%.*}"
    output_file="$output_directory/$filename_noext.m4a"

    ffmpeg -i "$file" -vn -c:a aac -strict experimental -b:a 192k -f mp4 "$output_file"
done
