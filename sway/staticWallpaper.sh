#!/usr/bin/env bash
# wall_path="$HOME/Pictures/background"
wall_path="$HOME/Pictures/background/official"

while true; do
  find "$wall_path" -type f | shuf | while read -r file; do 
    if [[ -f $file ]]; then
      file_name=$(basename "$file")
      swaybg -i $file -m fill
      sleep 90
    fi
  done
done

