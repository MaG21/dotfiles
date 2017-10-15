#!/bin/bash
#
# I could Spawn several processes to increase performance.
# But right now the waiting time is minimal if one has a
# decent internet connection.

if [ "$(uname)" == "Darwin" ]; then
	if ! type brew; then
		echo "brew needs to be installed in order to proceed."
		exit 1
	fi
fi

echo "Setup bash profile..."
cp bash_profile ~/.bash_profile
cp git/git-prompt.sh ~/.git-prompt.sh
source ~/.bash_profile

echo "Setup readline inputrc..."
cp inputrc ~/.inputrc

echo "Installing Utilities..."

if [ "$(uname)" == "Darwin" ]; then
	brew install --quiet tree
	brew install --quite wget
elif type yum &> /dev/null; then
	sudo yum install tree --quiet
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	sudo apt-get install tree -q=2 -y
fi

echo "Copying configuration file for Vim"

cp "./vimrc"     "${HOME}/.vimrc"

echo "Copying syntax files"
mkdir -p         "${HOME}/.vim/autoload" "${HOME}/.vim/bundle"
cp -r "./syntax" "${HOME}/.vim/"

echo "Copying colors files"
mkdir -p         "${HOME}/.vim/colors"
cp "./colors/basic-dark.vim" "${HOME}/.vim/colors"

echo "Installing plugins..."

if ! type curl &>/dev/null; then
	echo "Warning, curl is not present..."
	echo "trying to install curl..."

	if [ "$(uname)" == "Darwin" ]; then
		brew install --quiet curl
	elif type yum &> /dev/null; then
		sudo yum install curl --quiet
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install curl -q=2 -y
	fi
fi

if ! type ruby &>/dev/null; then
	echo "Tweaking irb..."
	gem install --silent awesome_print
	cp "ruby/irbrc" "${HOME}/.irbrc"
fi

echo "Installing Pathogen..."
curl -LSso   "${HOME}/.vim/autoload/pathogen.vim" 'https://tpo.pe/pathogen.vim'

cd  "${HOME}/.vim/bundle"

echo "Installing vim-airline..."
git clone 'https://github.com/bling/vim-airline.git'

echo "Installing ctrlp.vim..."
git clone 'https://github.com/kien/ctrlp.vim.git'

echo "Installing vim-surround..."
git clone 'git://github.com/tpope/vim-surround.git'

echo "Installing vim-javascript..."
git clone 'https://github.com/pangloss/vim-javascript.git'

# This plugin highlight trailing white spaces
echo "Installing vim-better-whitespace..."
git clone 'git://github.com/ntpeters/vim-better-whitespace.git'

echo "Installing vim plugin winresizer..."
git clone 'https://github.com/simeji/winresizer.git'

if ! type ag &> /dev/null; then
	echo "Installing ag..."
        if [ "$(uname)" == "Darwin" ]; then
		brew install --quiet the_silver_searcher
	elif type apt-get &> /dev/null; then
		sudo apt-get install silversearcher-ag -q=2
	elif type yum &> /dev/null; then
		sudo yum install the_silver_searcher --quiet
	else
		echo -e "\nNOTE:\nCan't dermine the system. Ag was not installed"
		echo "You won't be able to use the plugin CtrlP correctly, unless"
		echo "you change your ~/.vimrc and remove the part that uses ag."
		exit 1
	fi
fi

echo "Installing fugitive.vim ..."
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q  # generate doc

echo "done."

