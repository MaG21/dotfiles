#!/bin/bash
#

echo "Copying configuration file for Vim"
cp "./vimrc" "${HOME}/.vimrc"

echo "Installing plugins..."

mkdir -p     "${HOME}/.vim/autoload" "${HOME}/.vim/bundle"

echo "Installing Pathogen..."
# download Pathogen
curl -LSso   "${HOME}/.vim/autoload/pathogen.vim" 'https://tpo.pe/pathogen.vim' &

cd  "${HOME}/.vim/bundle"

echo "Installing vim-airline..."
# Install vim-airline
git clone 'https://github.com/bling/vim-airline.git'

echo "Installing ctrlp.vim..."
# Install ctrlp.vim
git clone 'https://github.com/kien/ctrlp.vim.git'

echo "done."

