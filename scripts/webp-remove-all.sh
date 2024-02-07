#!/bin/bash
directory="../pub/media"

cd "$directory" || exit

find . -type f -name '*.webp'

for f
  do
    base="${f%.*}"
    source_file_jpg="${base}".jpg
    source_file_jpeg="${base}".jpeg
    source_file_png="${base}".png

    if [ -f "$source_file_jpg" ] || [ -f "$source_file_png" ] || [ -f "$source_file_jpeg" ]; then
      rm "$f"
      echo "$f"
    fi;
  done