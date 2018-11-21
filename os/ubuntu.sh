#!/bin/bash

echo "UPDATING PACKAGES"
sudo apt update
sudo apt install git-core

printf "Setup bash environment..."
cp assets/environment/bash_profile ${HOME}/.bash_profile
echo "done"


printf "Checking Ruby..."
if ! type ruby &> /dev/null; then
	echo "Not installed."

	printf "Installing Ruby..."

	if ! type gpg &> /dev/null; then
		sudo apt-get install gnupg2 -y
	fi

	curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
	curl -sSL https://get.rvm.io | bash -s stable --ruby

	echo "Done."
fi

# git
cp assets/git/git-prompt.sh ~/.git-prompt.sh

# Apply changes to current terminal session
source ${HOME}/.rvm/scripts/rvm
source ${HOME}/.bash_profile
