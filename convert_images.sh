#!/bin/bash
FIREFOX="/usr/bin/firefox"
IMG_DIR="/home/churchy/Documents/dean_office_project/dean_office_project/images"

for i in {1..6}
do
    HTML_FILE="file://$IMG_DIR/query_results_$i.html"
    PNG_FILE="$IMG_DIR/query_results_$i.png"
    echo "Converting $HTML_FILE to $PNG_FILE using Firefox..."
    # Firefox screenshot syntax: firefox --headless --screenshot output.png input.html
    # We add a small delay to ensure rendering if possible, though firefox screenshot usually waits for load.
    # Note: Firefox headless sometimes needs --window-size to capture full table if it is large.
    $FIREFOX --headless --screenshot "$PNG_FILE" "$HTML_FILE" --window-size=1200,1000
    
    if [ -f "$PNG_FILE" ]; then
        echo "Success: $PNG_FILE created."
    else
        echo "Error: Failed to created $PNG_FILE"
    fi
done
