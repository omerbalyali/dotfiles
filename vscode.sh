#!/usr/bin/env bash

echo '\n'
echo '🟡 Installing VSCode extensions:'
cat ./vscode-extensions.txt | xargs -n 1 code --install-extension

echo '\n'
echo '🟢 VSCode extensions are installed.'
echo '\n'