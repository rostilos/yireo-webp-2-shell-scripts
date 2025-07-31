#!/bin/bash

if ! command -v crc32 &> /dev/null
then
    echo "crc32 command not found. Please install libarchive-tools."
    exit 1
fi

start=`date +%s`
directory="../pub/media"

cd "$directory" || exit
find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) -print0 |


while IFS= read -r -d $'\0' file;
  do
    target_filename=$(basename -- "$file")

    img_hash="$(crc32 <(echo -n "$target_filename"))"

    new_filename="${target_filename%.*}-${img_hash}.webp"
    new_filepath="$(dirname "$file")/$new_filename"

    echo "Converting: $file -> $new_filepath"

    cwebp -q 80 -quiet "$file" -o "$new_filepath"
  done

end=`date +%s`
runtime=$((end-start))

echo "Execution completed in $runtime seconds."
