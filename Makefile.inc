# These are lazy variables, and will be expanded
# when needed.
##

#
# RedHat
#
YUM = $(notdir $(shell which yum))

#
# OSX
#
BREW = $(notdir $(shell which brew))

#
# UBUNTU
#
APT  = $(notdir $(shell which apt-get))

#
# ENVIRONMENT
#

IS_BASH_PRESENT  := $(notdir $(shell which bash))
IS_ZSH_PRESENT   := $(notdir $(shell which zsh))
OPERATIVE_SYSTEM := unsupported
PACKAGE_INSTALL  :=

#
# PACKAGES
#
AG_PACKAGE   =
GIT_PACKAGE  = git
VIM_PACKAGE  = vim
CURL_PACKAGE = curl
TREE_PACKAGE = tree


#
# Detect operative system and package manager
#

ifeq ($(IS_BASH_PRESENT),bash)
  SHELL := /bin/bash
else ifeq ($(IS_ZSH_PRESENT),zsh)
  SHELL := /bin/bash
else
  # NOT SUPPORTED for other shells
  SHELL := $(wich nologin)
endif

ifeq ($(shell uname -s),Linux)
  OPERATIVE_SYSTEM = unsupported_linux

  ifeq ($(YUM),yum)
     OPERATIVE_SYSTEM = redhat
     PACKAGE_INSTALL  = sudo yum install --quiet -y

     AG_PACKAGE    = the_silver_searcher
  endif

  ifeq ($(APT),apt-get)
     OPERATIVE_SYSTEM = ubuntu
     PACKAGE_INSTALL  = sudo apt-get install -q=2 -y

     AG_PACKAGE    = silversearcher-ag
     GIT_PACKAGE   = git-core
  endif

endif

ifeq ($(shell uname -s),Darwin)
  OPERATIVE_SYSTEM = darwin
  PACKAGE_INSTALL  = brew install

  AG_PACKAGE    = the_silver_searcher
endif
