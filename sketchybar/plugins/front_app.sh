#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting


if [ "$SENDER" = "front_app_switched" ]; then
  # echo "$INFO" >> /Users/jebediahkerman/sketchylog 
  INFC=$(echo "$INFO" | cut -c1)
  UC=$(echo "$INFC" | tr '[:lower:]' '[:upper:]')
  # echo "$UC" >> /Users/jebediahkerman/sketchylog
  sketchybar --set "$NAME" label="$UC"
fi
