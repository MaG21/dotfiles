This repository represents a minimal environment set to my preferences.

In order to automate the installation process, one could execute the setup
script.

run:
`$ bash setup.sh`

However, generally speaking it does the following:
   * Sets the PS1 to a simple yet informative prompt.
   * Sets vi-mode for any program that uses readline (bash included).
   * Sets some usefull aliases and func (only fews).
   * Install few missing tools on Mac OSX (wget) and GNU/Linux.
   * Vim customizations. (explained below)

vimrc
=====
This is my vimrc file, I always try to keep it as much simple as I can while
keeping a feature full vim environment.

The following vim plugins will be installed by the script:
   * Pathogen
   * vim-airline
   * ctrlp.vim
   * vim-surround
   * vim-javascript
   * vim-better-whitespace
   * winresizer
