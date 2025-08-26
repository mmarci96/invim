#!/usr/bin/env bash
set -e
TARGET_HOME=/tmp/root

echo "Copy nvim config to target"
rm -rf $TARGET_HOME/.config/nvim
mkdir -p $TARGET_HOME/.config
cp -r /root/.config/nvim $TARGET_HOME/.config/

echo "Copy local files"
rm -rf $TARGET_HOME/.local/**/nvim
mkdir -p $TARGET_HOME/.local/state
rsync -a /root/.local/state/nvim $TARGET_HOME/.local/state/
rsync -a /root/.local/share/. $TARGET_HOME/.local/share
rsync -a /root/.local/lib64 $TARGET_HOME/.local/
rsync -a /root/.local/bin/nvim $TARGET_HOME/.local/bin/

echo "Build artifacts synced successfully."
exec "$@"

