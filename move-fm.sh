#!/bin/bash
CONFIG_DIR="$HOME/.config/move-fm"
STATIONS_FILE="$CONFIG_DIR/stations.txt"

if [[ ! -f "$STATIONS_FILE" ]]; then
  echo "Error: $STATIONS_FILE not found"
  exit 1
fi

# Read stations into arrays
declare -a names
declare -a urls

while IFS='|' read -r name url; do
  # Trim whitespace
  name=$(echo "$name" | xargs)
  url=$(echo "$url" | xargs)
  names+=("$name")
  urls+=("$url")
done < "$STATIONS_FILE"

echo "Available stations:"
for i in "${!names[@]}"; do
  echo "$((i + 1)) ${names[$i]}"
done

read -p "Select station (1-${#names[@]}): " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || ((choice < 1 || choice > ${#names[@]})); then
  echo "Invalid selection"
  exit 1
fi

selected_url="${urls[$((choice - 1))]}"
echo "Playing ${names[$((choice - 1))]}"
mpv "$selected_url"
