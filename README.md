# mikedijkstra dotfiles

Based off thoughtbot dotfiles

## Requirements

Set zsh as your login shell:

    chsh -s $(which zsh)

## Install

Clone onto your laptop:

    git clone git://github.com/mikedijkstra/dotfiles.git ~/dotfiles

Install [homebrew](https://brew.sh/):

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Brew bundle:

    brew bundle

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

## Other programs to install

- [Alfred](https://www.alfredapp.com/)
- Magnet (App Store)
