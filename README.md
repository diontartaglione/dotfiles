# Dotfiles

This repository contains my personal dotfiles.

## Installation

To get started, clone the repository and its submodules by running the following command:

```bash
git clone --recursive https://github.com/diontartaglione/dotfiles ~/.dotfiles
```

## Bootstrap

After cloning the repository, navigate to the `~/.dotfiles` directory and run the `bootstrap.sh` script to create symbolic links for the dotfiles defined in the `symlinks` file. This will link the source files to their respective destinations.

```zsh
cd ~/.dotfiles
./bootstrap.sh
```

The `symlinks` file contains a list of source and destination file pairs delimited by `|`.

## Adding Submodules

To add submodules to your dotfiles, you can use the following command:

```zsh
git submodule add <repository-url> <submodule-path>
```

After adding submodules, initialise and update them by running the following commands:

```zsh
git submodule init
git submodule update --remote
```

This will initialise the submodules and fetch the latest changes.

Feel free to customise and adapt these dotfiles according to your needs.
