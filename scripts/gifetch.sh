#!/usr/bin/env bash

# ───────────────────────────────────────────────────────────────
# Load all ASCII frame files
frames=("$HOME/gifetch/frames/ascii_frames/frame_"*.txt)
BLUE='\033[1;34m'
RESET='\033[0m'

# ───────────────────────────────────────────────────────────────
# Load utils (for cursor position)
source "$HOME/gifetch/scripts/utils.sh"
read CURSOR_ROW CURSOR_COL < <(get_cursor_position)

# Measure terminal height
TOTAL_LINES=$(tput lines)

# Measure height of one ASCII frame
FRAME_HEIGHT=$(wc -l <"${frames[0]}")
NEOFETCH_OFFSET=2 # Neofetch title line spacing
REQUIRED_SPACE=$((CURSOR_ROW + FRAME_HEIGHT + NEOFETCH_OFFSET))

# If not enough space, clear screen and remeasure position
if ((REQUIRED_SPACE >= TOTAL_LINES)); then
  clear
  read CURSOR_ROW CURSOR_COL < <(get_cursor_position)
fi

# ───────────────────────────────────────────────────────────────
# Hide cursor and switch to raw input mode (no echo, no Enter required)
tput civis
stty -echo -icanon time 0 min 0

# ───────────────────────────────────────────────────────────────
# Draw system info (neofetch) on the right once
tput cup "$CURSOR_ROW" 40
neofetch --ascii ~/.config/neofetch/ascii_logo.txt

# ───────────────────────────────────────────────────────────────
# Principal Loop
while true; do
  for f in "${frames[@]}"; do
    tput cup "$CURSOR_ROW" 0
    echo -e "${BLUE}$(<"$f")${RESET}"
    sleep 0.033

    # ─── comprobar si hay una tecla presionada:
    if read -rsn1 -t 0; then
      break 2
    fi
  done
done

# ───────────────────────────────────────────────────────────────
# Restore normal terminal behavior
stty sane
tput cnorm
