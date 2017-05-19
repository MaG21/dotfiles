This repository represents a minimal environment of a unix-like environment
set to my preferences.

In order to automate the installation process, one could execute the setup
script to download and install the necessary plugins on a unix-like
environment.

However, generally speaking it does the following:
   * Sets the PS1 to a simple yet informative prompt, that keeps track of the number of tasks in background as well as git's current state in certain repostories.
   * Sets vi-mode for any program that uses readline (bash included).
   * Sets some usefull aliases and func (only fews).
   * Install few missing tools on Mac OSX (wget) and GNU/Linux.
   * Vim customizations. (explained below)

vimrc
=====
This is my vimrc file, I always try to keep it as much simple as I can while
keeping a feature full vim environment.

In order to automate the installation process, one could execute the setup
script to download and install the necessary plugins on a unix-like
environment.

run:
`$ bash setup.sh`

to install plugins automatically.

The following vim plugins will be installed by the script:
   * Pathogen
   * vim-airline
   * ctrlp.vim
   * vim-surround
   * vim-javascript
   * vim-better-whitespace
   * winresizer
