#!/bin/sh

# Point to target snapshot directory.
target_dir="./snapshots/default_snapshot"

# Install fonts from fonts directory.
cp fonts $HOME/.local/share

# Install packages needed
cat $target_dir/packages.install | xargs sudo apt install -y

# Add zsh install and config.
#::TODO

# Backup pre-existing dotfiles.
mv $HOME/.config/dconf/user $HOME/.config/dconf/user.bak
mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.zshrc $HOME/.zshrc.bak

# Make GNOME-Terminal dconf directory.
mkdir -p $HOME/.config/dconf

# Copy dotfiles to user home directory.
cp -r $target_dir/.config/dconf/user $HOME/.config/dconf
cp -r $target_dir/packages.install $HOME/.packages.install
cp -r $target_dir/.tmux.conf $HOME
cp -r $target_dir/.vimrc $HOME
cp -r $target_dir/.zshrc $HOME
