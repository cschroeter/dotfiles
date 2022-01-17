#!/usr/bin/env bash

PACKAGES=(
    coreutils # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    moreutils
    findutils
    git
    git-lfs
    gmp
    grep
    node
    openssh
    openssl
    p7zip
    pigz
    rename
    screen
    tree
    vim 
    wget
    yarn
    zsh
)

APPS=(
    caffeine
    docker
    firefox
    figma
    google-chrome
    slack
    spotify
    visual-studio-code
    vlc
    whatsapp
)

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to your PATH:
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/christian/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install packages
brew install ${PACKAGES[@]}

# Install apps
brew install ${APPS[@]}

# Remove outdated versions from the cellar.
brew cleanup
