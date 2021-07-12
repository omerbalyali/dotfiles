# .dotfiles

## ⚠️ **Do not use the dotfiles as it is, feel free to fork or clone and customise for your use case.**

This dotfiles repo contains an opinionated macOS development/regular-use environment with an automated setup, compatible with macOS 11 Big Sur.

It's not intended to fit for different needs, and may broke your system under some conditions. Setup includes highly-specified locations for some settings/apps/files, therefore it's cautioned to be configured and confirmed manually before going forward with the setup.

Basic setup process is first installing the latest updates and Apple command-line tools. Using `homebrew` (or `brew`) as the preferred package manager eases installation and update process for many binaries and desktop apps, so we continue with an opinionated `brew` script, which installs necessary dependencies and `cask` apps.

## Setup a new machine

Start with the most up to date state:

```
sudo softwareupdate -i -a
xcode-select --install
```

```
sh -c "`curl -fsSL https://raw.github.com/omerbalyali/dotfiles/master/remote-install.sh`"
./setup.sh
```

## Install/Update Homebrew & Apps

```
./brew.sh
```

## macOS defaults

```
source .macos_defaults
```
