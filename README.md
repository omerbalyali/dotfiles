# .dotfiles

## ⚠️ **Do not use the dotfiles as it is; feel free to fork or clone and customize for your use case.**

This dotfiles repo contains an opinionated macOS development/regular-use environment with an automated setup, compatible with macOS 11 Big Sur.

It's not intended to fit for different needs and may break your system under some conditions. Setup includes highly specified locations for some settings/apps/files; therefore, it's cautioned to be configured and confirmed manually before going forward with the setup.

The Basic setup process is first installing the latest updates and Apple command-line tools. Using `homebrew` (or `brew`) as the preferred package manager eases the installation and update process for many binaries and desktop apps, so we continue with an opinionated `brew` script, which installs necessary dependencies and `cask` apps.

## Setup a new machine

Start with the most up to date state:

Clone the repo to `~/.dotfiles` folder and setup with just one command:

```
./setup.sh
```

If you want to install extras, then add the argument `--extras` or `-e` to the script

```
./setup.sh --extras
```

Music apps (`--music` or `-m`):

```
./setup.sh --music
```

Personalized settings (`--personalized` or `-p`):

```
./setup.sh --personalized
```
