#!/usr/bin/env bash

INPUT="$1"
NAME=$(basename "$INPUT" .gif)
FRAME_DIR="frames"
ASCII_DIR="$FRAME_DIR/ascii_frames"

# ───────────────────────────────────────────────────────────────
if [[ ! -f "$INPUT" ]]; then
  echo " GIF file not found: $INPUT"
  exit 1
fi

# ───────────────────────────────────────────────────────────────
echo "  Cleaning previous frames..."
rm -f "$FRAME_DIR"/*.png
rm -f "$ASCII_DIR"/*.txt

# ───────────────────────────────────────────────────────────────
echo "  Extracting frames from $INPUT..."
mkdir -p "$FRAME_DIR"
ffmpeg -loglevel error -i "$INPUT" "$FRAME_DIR/frame_%03d.png"

# ───────────────────────────────────────────────────────────────
echo "  Converting frames to ASCII..."
mkdir -p "$ASCII_DIR"
for f in "$FRAME_DIR"/frame_*.png; do
  jp2a --width=40 "$f" >"$ASCII_DIR/$(basename "${f%.png}.txt")"
done

cp frames/ascii_frames/frame_001.txt ~/.config/neofetch/ascii_logo.txt

# ───────────────────────────────────────────────────────────────
echo "  Done. ASCII frames ready in $ASCII_DIR/"
