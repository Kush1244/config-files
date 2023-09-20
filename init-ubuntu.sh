#!/usr/bin/bash

cp ./.bashrc ~/


# Load gnome-setting
dconf load / < ./keybindings.dconf
dconf lod / < ./settings.confg

# Get git
./git/install_git.sh

# Get c and c++ compilers, language server and formatter
./c_cpp/c_cpp_lang.sh
cp ./.clangd ~/ 
cp ./.clang-format ~/

# Get editors
./editor/get-code-editors.sh
./editor/vim/init_vim.sh
cp ./.vimrc ~/

# Get misclenaous tools torrent client, media player
./miscellaneous/get_other.sh


# Source the .bashrc
source ~/.bashrc
