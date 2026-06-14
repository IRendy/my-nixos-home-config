#!/bin/bash

# 你的触控板名称
touchpad_name="ELAN06FA:00 04F3:327E Touchpad"

# 检查触控板状态
status=$(xinput list-props "$touchpad_name" | grep "Device Enabled" | awk '{print $4}')

if [ "$status" -eq 1 ]; then
  #echo "🖱️" # 触控板启用时显示的图标
  # 或者使用文字显示
  echo "On"
else
  #echo "❌" # 触控板禁用时显示的图标
  echo "Off"
fi
