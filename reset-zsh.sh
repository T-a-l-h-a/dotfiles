#!/bin/bash

# Backup existing Zsh configuration
echo "Backing up existing Zsh configuration..."
mkdir -p ~/zsh-backup
mv ~/.zshrc ~/.zsh_history ~/.zprofile ~/.zshenv ~/.zlogout ~/.p10k.zsh ~/zsh-backup/ 2>/dev/null

# Remove Oh My Zsh and Powerlevel10k
echo "Removing Oh My Zsh and Powerlevel10k..."
rm -rf ~/.oh-my-zsh
rm -rf ~/.p10k.zsh
rm -rf ~/.zshrc

# Reinstall Oh My Zsh
echo "Reinstalling Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Set Powerlevel10k as the default theme
echo "Setting Powerlevel10k as the Zsh theme..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Source the new .zshrc
echo "Sourcing .zshrc..."
source ~/.zshrc

# Run Powerlevel10k configuration wizard
echo "Running Powerlevel10k configuration wizard..."
p10k configure

echo "Zsh has been reset and configured with Oh My Zsh and Powerlevel10k!"
