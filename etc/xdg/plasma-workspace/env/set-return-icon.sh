set -eu

board_name=$(cat /sys/class/dmi/id/board_name 2>/dev/null || true)
if [[ "$board_name" == "Jupiter" || "$board_name" == "Galileo" ]] then
    destination="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/scalable/actions"
    mkdir -p $destination
    ln -sf /usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg $destination/gaming-return.svg
fi

# Sync latest changes from upstream, and put the shortcut back if it's missing,
# since it's the easiest way back to Gaming Mode from a desktop session.

mkdir -p "$HOME/Desktop"
cp /etc/skel/Desktop/Return.desktop "$HOME/Desktop/Return.desktop"
