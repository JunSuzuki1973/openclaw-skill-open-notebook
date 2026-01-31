#!/bin/bash
# List Open Notebook notebooks
# Usage: ./list_notebooks.sh

CONFIG_FILE="$HOME/.clawdbot/open-notebook-config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file not found: $CONFIG_FILE"
    exit 1
fi

API_URL=$(jq -r '.apiUrl' "$CONFIG_FILE")
API_KEY=$(jq -r '.apiKey' "$CONFIG_FILE")

curl -s -X GET "${API_URL}/notebooks" \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $API_KEY" | jq '.'
