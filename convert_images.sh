#!/bin/bash
CHROME="/usr/bin/google-chrome"
IMG_DIR="/home/churchy/Documents/dean_office_project/dean_office_project/images"

for i in {1..6}
do
    HTML_FILE="$IMG_DIR/query_results_$i.html"
    PNG_FILE="$IMG_DIR/query_results_$i.png"
    echo "Converting $HTML_FILE to $PNG_FILE..."
    $CHROME --headless --disable-gpu --screenshot="$PNG_FILE" --window-size=1200,1000 --virtual-time-budget=5000 "file://$HTML_FILE"
    if [ -f "$PNG_FILE" ]; then
        echo "Success: $PNG_FILE created."
    else
        echo "Error: Failed to created $PNG_FILE"
    fi
done
