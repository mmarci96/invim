#!/usr/bin/env bash
set -e
TARGET_HOME=/tmp/root

echo "Copy .config"
mkdir -p $TARGET_HOME/.config
cp -r /root/.config/nvim $TARGET_HOME/.config/

echo "Copy state"
mkdir -p $TARGET_HOME/.local/state
cp -r /root/.local/state/nvim $TARGET_HOME/.local/state/

echo "Copy share"
mkdir -p $TARGET_HOME/.local/share/nvim
cp -r /root/.local/share/nvim $TARGET_HOME/.local/share/

echo "copy nvim bin file"
cp -r /root/.local/bin/nvim $TARGET_HOME/.local/bin/

echo "✅ Build artifacts synced successfully."
exec "$@"

