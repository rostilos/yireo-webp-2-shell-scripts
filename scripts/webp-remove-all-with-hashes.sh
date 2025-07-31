#!/bin/bash
directory="../pub/media"

cd "$directory" || exit

for file in $(find . -type f -name '*.webp')
 do
    basename="${file%.*}"
    base="${basename%-*}"

    source_file_jpg="${base}".jpg
    source_file_jpeg="${base}".jpeg
    source_file_png="${base}".png

    if [ -f "$source_file_jpg" ] || [ -f "$source_file_png" ] || [ -f "$source_file_jpeg" ]; then
      rm "$file"
      echo "$file"
    fi;
  done
