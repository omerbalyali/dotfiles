#!/usr/bin/env bash

# Install preferred extensions
cat ./vscode_extensions.txt | xargs -n 1 code --install-extension