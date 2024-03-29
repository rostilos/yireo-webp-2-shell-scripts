#!/bin/bash
start=`date +%s`
directory="../pub/media"

cd "$directory" || exit
find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) -print0 |

while IFS= read -r -d $'\0' file;
  do
    filename=$(basename -- "$file")
    new_filename="${filename%.*}.webp"
    new_filepath="$(dirname "$file")/$new_filename"
    echo "Converting: $file -> $new_filepath"
    cwebp -q 80 -quiet "$file" -o "$new_filepath"
  done

end=`date +%s`
runtime=$((end-start))

echo "Execution completed in $runtime seconds."