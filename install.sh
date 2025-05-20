#!/usr/bin/env bash

echo "󰏖  Installing gifetch"

# ───────────────────────────────────────────────────────────────
# Required tools
REQUIRED=(ffmpeg jp2a neofetch)

for pkg in "${REQUIRED[@]}"; do
  if ! command -v "$pkg" >/dev/null 2>&1; then
    echo "  Installing $pkg..."
    sudo pacman -S --needed --noconfirm "$pkg"
  else
    echo "  $pkg already installed."
  fi
done

# ───────────────────────────────────────────────────────────────
# Set up aliases
if [[ "$(basename "$SHELL")" == "bash" ]]; then
  SHELL_RC="$HOME/.bashrc"
else
  SHELL_RC="$HOME/.zshrc"
fi

add_alias() {
  local ALINE="$1"
  if ! grep -Fxq "$ALINE" "$SHELL_RC"; then
    echo "$ALINE" >>"$SHELL_RC"
    echo "  Added alias: $ALINE"
  else
    echo "  Alias already present: $ALINE"
  fi
}

add_alias "#gifetch alias"
add_alias "alias gifetch=\"$HOME/gifetch/scripts/gifetch.sh\""
add_alias "alias gif2ascii=\"$HOME/gifetch/scripts/gif2ascii.sh\""

# ───────────────────────────────────────────────────────────────
echo -e "\n  Setup complete. Run:"
echo "source $SHELL_RC"
echo -e "\nThen try:"
echo "gif2ascii ./gifs/yourgif.gif"
echo "gifetch"

exit 0
