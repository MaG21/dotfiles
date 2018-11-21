# Minimal environment set to my preferences.

To install this automatically, make sure you have `make` installed.

Before going any futher, let me tell you that, this little project would be the beautiest
you'll seen in a while. Don't believe me? Check this out:

#### To install the environment run:
```sh
make
```

#### Install just the basic environment run:
```sh
make basic
```

#### You're just here because of my Vim environment huh? Sure:
```sh
make vim
```

See the pattern? Yes, `make` is a little beast, let him work, he'll know how to solve
the depentencies.

> Wait a second ... `make` !? ... wot? MMM ...
> Yes my friend! you could tell `make` to work in parallel

#### To install the environment in parallel run:
```sh
make -j 3
```

Yes, by now you just want to see the Goddarm `Makefile`, but ... you'll be disappointed of how
simple it is;).

## What gets installed

Generally speaking:
   * Sets the PS1 to a simple yet informative prompt.
   * Sets vi-mode for any program that uses readline (bash included).
   * Sets some usefull aliases and func (only fews).
   * Install few missing tools on Mac OSX (wget) and GNU / Linux (tree)
   * Vim customizations. (explained below)

vimrc
=====
This is my vimrc file, I always try to keep it as simple as I can while
keeping a feature full vim environment.

The following vim plugins will be installed by the script:
   * vim-plug
   * vim-airline
   * denite.nvim or ctrlp.vim. (it depends on vim being compiled or not with python3 support)
   * vim-surround
   * vim-javascript
   * vim-better-whitespace
