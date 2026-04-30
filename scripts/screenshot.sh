#!/bin/bash
# Path: ~/.scripts/screenshot.sh

# Directory setup
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE_PATH="$DIR/shot_$(date +%Y%m%d_%H%M%S).png"

# Capture region using slurp and grim
# If you press ESC or cancel, it exits quietly
if ! /usr/bin/slurp | /usr/bin/grim -g - "$FILE_PATH"; then
    exit 0
fi

# Send notification with SwayNC (Actions render as buttons)
# --action="edit=Edit": Button to open Satty
# --action="delete=Delete": Button to delete the image
RESPONSE=$(notify-send "Screenshot Captured" "What would you like to do?" \
    --icon="$FILE_PATH" \
    --action="edit=Edit" \
    --action="delete=Delete")

# Handle user response
case "$RESPONSE" in
    "edit")
        # Open Satty for editing
        # -f: input file, --output-filename: output file
        # Satty allows intuitive cropping, drawing, and saving.
        hyprctl dispatch exec "[float;center;size 900 600] satty -f $FILE_PATH --output-filename $FILE_PATH"
        ;;
    "delete")
        # Remove the file and notify
        rm "$FILE_PATH"
        notify-send "Deleted" "Screenshot has been removed" --icon=edit-delete
        ;;
esac
