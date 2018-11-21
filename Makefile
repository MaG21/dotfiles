# By Manuel A. Güílamo, MaG
# https://github.com/MaG21

include Makefile.inc

BASIC_TARGETS  := environment git vim
ALL_TARGETS    := $(BASIC_TARGETS) ag curl tree ruby gems

all:   $(OPERATIVE_SYSTEM) $(ALL_TARGETS)
basic: $(OPERATIVE_SYSTEM) $(BASIC_TARGETS)

ag:
	-$(PACKAGE_INSTALL) $(AG_PACKAGE)
git:
	$(PACKAGE_INSTALL) $(GIT_PACKAGE)
curl:
	$(PACKAGE_INSTALL) $(CURL_PACKAGE)
vim: curl
	$(PACKAGE_INSTALL) $(VIM_PACKAGE)
	@cp assets/vim/vimrc ~/.vimrc
	@mkdir -p ~/.vim/autoload ~/.vim/bundle
	@cp -r assets/vim/syntax ~/.vim/
	@mkdir -p ~/.vim/colors
	@cp -r assets/vim/colors/basic-dark.vim ~/.vim/colors
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
tree:
	@echo "Installing tree..."
	-$(PACKAGE_INSTALL) $(TREE_PACKAGE)

environment: curl git
	@cp assets/git/gitignore_global ~/.gitignore
	@git config --global core.excludesFile ~/.gitignore
	@cp assets/environment/inputrc ~/.inputrc
ifeq ($(IS_BASH_PRESENT),bash)
	@echo "Setup bash profile..."
	@cp assets/environment/bash_profile ~/.bash_profile
	@cp assets/git/git-prompt.sh ~/.git-prompt.sh
	echo "sourcing"
	. ~/.bash_profile
endif

gnupg2:
	$(PACKAGE_INSTALL) $(GNUPG_PACKAGE)
	# retrieve necessary keys
	@gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

ruby: curl gnupg2
	@echo "INSTALLING RUBY..."
	@curl -sSL https://get.rvm.io | bash -s stable --ruby

gems: ruby
ifeq ($(IS_BASH_PRESENT),bash)
	-source ~/.rvm/scripts/rvm
endif

ifneq ($(shell which ruby),)
	@echo "Installing Ruby gems"
	@gem install --silent bundle

	@echo "Tweaking irb..."
	@gem install --silent awesome_print
	@cp assets/ruby/irbrc ~/.irbrc
endif








#
# SETUP
#


brew:
ifeq ($(BREW),)
	@echo "brew needs to be installed in order to proceed."
	@exit 1
endif

darwin: brew
	brew install wget

rethat:
	# insert setup commands here

ubuntu:
	@echo "Updating packages..."
	sudo apt-get update
	sudo apt-get install -q=2 -y build-essential make
unsupported:
	@echo "[ERROR]: Operative System not supported"
	exit 1
unsupported_linux:
	@echo "[ERROR]: Unsupported GNU/Linux distribution"
	exit 1

.PHONY: all brew darwin rethat ubuntu unsupported unsupported_linux $(ALL_TARGETS)
