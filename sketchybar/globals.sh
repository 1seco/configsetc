#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
export OX_MA="0xffcba6f7"
export OX_BG="0xff1e1e2e"
export OX_TX="0xffcdd6f4"
export OX_MG="0xff7f849c"
export OX_ORG="0xff9399b2"
export SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

export SB_BAR=(
  position=left
  height=48
  sticky=on
  topmost=on
  shadow=on
  y_offset=0
  margin=0
  padding_left=16
  padding_right=16
  color="$OX_BG"
  border_color="$OX_MA"
  border_width=2
  corner_radius=10
  font_smoothing=on
)

export SB_DEFAULT=(
  icon.font.family="SF Pro"
  icon.font.style="Regular"
  icon.font.size=16
  icon.color="$OX_MA"
  label.font="FiraCode Nerd Font Mono"
  label.font.style="Regular"
  label.font.size=14
  label.color="$OX_TX"
  padding_left=10
  padding_right=10
  icon.align=center
  icon.padding_right=8
  icon.padding_left=8
  icon.highlight_color="$OX_MA"
)
