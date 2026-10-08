#!/usr/bin/env bash
wall_path="$HOME/Pictures/background/official"

while true; do
  # 只找图片文件，并打乱顺序
  find "$wall_path" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf | while read -r file; do
    if [[ -f "$file" ]]; then
      swaymsg output "*" bg "$file" fill
      sleep 90
    fi
  done
  # 如果目录为空，稍等再试，避免忙循环
  sleep 5
done
