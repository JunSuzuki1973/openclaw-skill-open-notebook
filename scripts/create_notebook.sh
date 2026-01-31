#!/bin/bash
# Create a new notebook
# Usage: ./create_notebook.sh "Notebook Name" "Description"

CONFIG_FILE="$HOME/.clawdbot/open-notebook-config.json"
NAME="${1:-New Notebook}"
DESCRIPTION="${2:-My research notes}"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file not found: $CONFIG_FILE"
    exit 1
fi

API_URL=$(jq -r '.apiUrl' "$CONFIG_FILE")
API_KEY=$(jq -r '.apiKey' "$CONFIG_FILE")

curl -s -X POST "${API_URL}/notebooks" \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $API_KEY" \
    -H 'Content-Type: application/json' \
    -d "{
        \"name\": \"$NAME\",
        \"description\": \"$DESCRIPTION\"
    }" | jq '.'
