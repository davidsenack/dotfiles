#!/usr/bin/sh
#
# Snapshot takes a current snapshot of the user's dotfiles and installed packages
# and moves them into dotfiles/snapshots/XXXXXX_xxxxxx_snapshot/ directory.

# Create unique filename and path.
timestamp=$(date +"%Y%m%d-%H:%M:%S")
dirname="${timestamp}_snapshot"
dirpath="./snapshots/${dirname}"

# Create specific snapshot directory and necessary subdirectories.
mkdir -p "./$dirpath/.config/dconf"

# Take snapshot of currently installed APT packages (remove unnecessary first line).
apt list --installed | awk -F '/' '{print $1}' >> "$dirpath/packages.install"
sed -i '1d' "$dirpath/packages.install"

# Copy dotfiles to snapshot directory.
cp $HOME/.config/dconf/user $dirpath/.config/dconf/user
cp $HOME/.packages.install $dirpath/packages.install
cp $HOME/.tmux.conf $dirpath/.tmux.conf
cp $HOME/.vimrc $dirpath/.vimrc
cp $HOME/.zshrc $dirpath/.zshrc
