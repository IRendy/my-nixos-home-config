#!/bin/bash

# 你的触控板名称
touchpad_name="ELAN06FA:00 04F3:327E Touchpad"

# 检查当前状态
status=$(xinput list-props "$touchpad_name" | grep "Device Enabled" | awk '{print $4}')

if [ "$status" -eq 1 ]; then
  # 如果启用，则禁用它
  xinput disable "$touchpad_name"
  # 可以发送桌面通知（如果你使用了通知守护进程，如Dunst）
  # notify-send "触控板已禁用" -t 2000
else
  # 如果禁用，则启用它
  xinput enable "$touchpad_name"
  # notify-send "触控板已启用" -t 2000
fi

# 刷新Polybar模块（使状态显示立即更新）
# 假设你的Polybar配置中此模块名为[touchpad]
polybar-msg action "#touchpad.click" 2>/dev/null || true
