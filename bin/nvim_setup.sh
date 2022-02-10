#!/usr/bin/env bash
set -exu
set -o pipefail

echo "Creating python virtual environment"
NVIMVENV=$HOME/.venv/nvim

if [[ ! -d "$NVIMVENV" ]]; then
  python3 -m venv "$HOME/.venv/nvim"
fi

source "$NVIMVENV/bin/activate"
python -m pip install --upgrade pynvim

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 16
npm install -g vim-language-server neovim
