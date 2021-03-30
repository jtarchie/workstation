#!/bin/bash -i

set -eux

# install deps from `brew`
brew bundle
# check that the script is a good bash citizen
shellcheck setup.sh

# set the shell to bash
if [ "$SHELL" != "/usr/local/bin/bash" ]; then
    chsh -s /bin/bash
fi

# install bash-it if it has not been
if [ ! -e ~/.bash_it ]; then
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
fi
    # TODO: figure out how to use bash-it function in script
    # bash-it update stable
    # bash-it enable alias \
    #   git \
    #   curl
    # bash-it enable plugin \
    #   git \
    #   go \
    #   ruby \
    #   rvm

dotfiles="$PWD/dotfiles"
# setup git to be ergonomic
ln -sf "$dotfiles/.git-authors" "$HOME/.git-authors"
if grep "$dotfiles/.git-config" -q -f "$HOME/.gitconfig" ; then
    cat "$dotfiles/.git-config" >> "$HOME/.gitconfig"
fi