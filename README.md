# .dotfiles

## ⚠️ **Do not use the dotfiles as it is; feel free to fork or clone and customize for your use case.**

This dotfiles repo contains an opinionated macOS development/regular-use environment with an automated setup, compatible with macOS 11 Big Sur.

It's not intended to fit for different needs and may break your system under some conditions. Setup includes highly specified locations for some settings/apps/files; therefore, it's cautioned to be configured and confirmed manually before going forward with the setup.

The Basic setup process is first installing the latest updates and Apple command-line tools. Using `homebrew` (or `brew`) as the preferred package manager eases the installation and update process for many binaries and desktop apps, so we continue with an opinionated `brew` script, which installs necessary dependencies and `cask` apps.

### Table of Contents

- [Clone the repo](#clone-the-repo)
- [Prepare](#prepare)
- [Install](#install)
- [macOS Defaults](#macos-defaults)

## Clone the repo

Start with the most up-to-date state:

Clone the repo to `~/.dotfiles` folder, and navigate into it:

```sh
cd ~/.dotfiles
```

### Prepare

Installs macOS updates, Apple Command Line Developer Tools, Homebrew and Oh-My-Zsh

```sh
source prepare.sh
```

### Install

Installs utilities and apps with Homebrew and symlinks preferred `.dotfile` settings with GNU Stow.
Please check the `Brewfile` before running this command, you most probably would not want to install the apps and utilities that I prefer, and you may want to add more. After the `pre-install` script, you can search apps you want through `brew search <utility-name>`, and `brew search --cask <application-name>` for casks/desktop-apps, or you can use [Homebrew's website brew.sh](https://brew.sh) for any app or utility.

This command can be used as an update command as well, because of this _pre-install_, and _install_ scripts are separated.
This file contains the sourcing commands for the `brew.sh` and `stow.sh` scripts, so these files can be triggered separately as well. *Stow*ing will remove the symlinks and relink them.

```sh
source install.sh
```

### macOS Defaults

`defaults.sh` script contains useful macOS settings with default options. I personally tested every command with macOS Ventura 13.0.1, and most of the commands are also has been tested starting from macOS Monterey 12.0.1 (as Apple changed some of their commands prior to macOS Monterey). If you've ever been used any other _defaults_ script before, it's highly possible that these scripts are outdated, that's why I took the time to prepare an updated version.

Do not run this script without checking the defaults for your use-case, as these are specific to region, language and locale. Also some settings may not suit your needs. Use it as a template, the script contains most other option as comments or commented out commands.

```sh
source macos-defaults.sh
```

## License

&copy; 2022 Ömer Balyalı &mdash; [MIT License](LICENSE)
