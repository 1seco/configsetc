#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
./"$CONFIG_DIR/globals.sh"

A_TIME=0
D_TIME=0
B_TIME=0

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="────────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_TX" \
		label.align=center 
}

sb_clock() {
	sketchybar \
		--add item clock "$1" \
		--set clock \
		update_freq=10 \
		label.font.size=14.0 \
		icon.drawing=off \
		script="$PLUGIN_DIR/clock.sh"
}

sb_date() {
	sketchybar \
		--add item day "$1" --set day update_freq=120 icon.drawing=off padding_right=4 script="A_DATE=$(date '+%a')" label="$A_DATE"\
		--add item date "$1" --set date update_freq=120 icon.drawing=off padding_right=4 script="D_DATE=$(date '+%d')" \
		--add item month "$1" --set month update_freq=120 icon.drawing=off padding_right=4 script="B_DATE=$(date '+%b')"
}


sb_spaces() {
	for i in "${!SPACE_ICONS[@]}"; do
		sid=$((i + 1))

		sketchybar \
			--add space space.$sid "$1" \
			--subscribe space.$sid window_change \
			--set space.$sid \
			\
			associated_space=$sid \
			icon="$i" \
			icon.padding_left=16 \
			icon.padding_right=16 \
			background.color=0x409399b2 \
			background.corner_radius=5 \
			icon="${SPACE_ICONS[i]}" \
			icon.font.size=14 \
			label="·" \
			label.drawing=off \
			label.padding_right=16 \
			label.padding_left=16 \
			background.height=36 \
			script="$PLUGIN_DIR/space.sh" \
			click_script="yabai -m space --focus $sid"

		if [[ $sid == 6 ]]; then sb_separator left 14 14; fi
	done
}

sb_battery() {
	sketchybar \
		--add item battery "$1" \
		--subscribe battery system_woke power_source_change \
		--set battery \
		\
		script="$PLUGIN_DIR/battery.sh" \
		update_freq=120 \
		label.color=$OX_MA
}
