#!/usr/bin/env bash
set -exu
set -o pipefail

echo "Creating python virtual environment"
NVIMVENV=$HOME/.venv/nvim

if [[ ! -d "$NVIMVENV" ]]; then
  python3 -m venv "$HOME/.venv/nvim"
fi

# shellcheck source=/home/hootieben/.venv/bin/activate
source "$NVIMVENV/bin/activate"
python -m pip install --upgrade pynvim

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/home/hootieben/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck source=/home/hootieben/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 16
npm install -g vim-language-server neovim
