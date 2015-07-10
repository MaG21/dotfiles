#!/bin/bash
#

echo "Copying configuration file for Vim"
cp "./vimrc" "${HOME}/.vimrc"

echo "Installing plugins..."

mkdir -p     "${HOME}/.vim/autoload" "${HOME}/.vim/bundle"

if type curl 2>/dev/null; then
	if [ "$(uname)" == "Darwin" ]; then
		brew install --quiet curl
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install curl -q=2
	fi
fi

echo "Installing Pathogen..."
curl -LSso   "${HOME}/.vim/autoload/pathogen.vim" 'https://tpo.pe/pathogen.vim'

cd  "${HOME}/.vim/bundle"

echo "Installing vim-airline..."
git clone 'https://github.com/bling/vim-airline.git'

echo "Installing ctrlp.vim..."
git clone 'https://github.com/kien/ctrlp.vim.git'

if type ag 2>/dev/null; then
        if [ "$(uname)" == "Darwin" ]; then
		brew install --quiet the_silver_searcher
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install silversearcher-ag -q=2
        fi
fi

echo "done."

