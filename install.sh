#!/bin/sh

# Install packages needed
cat packages.install | xargs sudo apt install -y

# Add zsh install and config
#::TODO

# Backup pre-existing dotfiles
mv $HOME/.config/dconf/user $HOME/.config/dconf/user.bak
mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.zshrc $HOME/.zshrc.bak

# Make GNOME-Terminal dconf directory
mkdir -p $HOME/.config/dconf

# Copy dotfiles to user home directory
cp .config/dconf/user $HOME/.config/dconf
cp packages.install $HOME/.packages.install
cp .tmux.conf $HOME
cp .vimrc $HOME
cp .zshrc $HOME

# Reload Zsh
source .zshrc
