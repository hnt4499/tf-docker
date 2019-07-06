#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/hnt4499/oh-my-zsh/master/tools/vimproc.sh)"

# Install necessary packages
apt-get install -y --no-install-recommends build-essential make

# Clone official repository and compile
git clone https://github.com/Shougo/vimproc.vim.git
echo "Compiling vimproc.vim"
cd vimproc.vim && make

# Copy necessary files to $HOME/.vim folder
cp -RT autoload/ $HOME/.vim/autoload && cp -RT lib/ $HOME/.vim/lib && cp -RT plugin/ $HOME/.vim/plugin
echo "Copying files to '"$HOME"/.vim/' ... Done"

# Cleaning
cd .. && rm -r vimproc.vim
echo "Cleaning ... Done"
