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
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

	if ! type ruby &> /dev/null; then
		if ! type gpg &> /dev/null; then
			sudo apt-get install gnupg2 -y
		fi

		curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
		curl -sSL https://get.rvm.io | bash -s stable --ruby
		
		source ~/.rvm/scripts/rvm
	fi
fi

echo "Setup bash profile..."
cp bash_profile ~/.bash_profile
cp git/git-prompt.sh ~/.git-prompt.sh
source ~/.bash_profile

echo "Setup readline inputrc..."
cp inputrc ~/.inputrc

echo "Setup gitignore_global"
cp git/gitignore_global /.gitignore_global

if type ruby &>/dev/null; then
	echo "Tweaking irb..."
	gem install --silent awesome_print
	cp "ruby/irbrc" ~/.irbrc
fi

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
cp "./vimrc"     ~/.vimrc

echo "Copying syntax files"
mkdir -p         ~/.vim/autoload ~/.vim/bundle
cp -r "./syntax" ~/.vim/

echo "Copying colors files"
mkdir -p         ~/.vim/colors
cp ./colors/basic-dark.vim ~/.vim/colors

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

echo "Installing vim-plug..."
mkdir -p ~/.vim/plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if ! type ag &> /dev/null; then
	echo "Installing ag..."
        if [ "$(uname)" == "Darwin" ]; then
		brew install --quiet the_silver_searcher
	elif type apt-get &> /dev/null; then
		sudo apt-get install silversearcher-ag -q=2
	elif type yum &> /dev/null; then
		sudo yum install the_silver_searcher --quiet
	fi
fi

vim +PlugInstall +qall

echo "done."

