#!/bin/bash

[ ! -s "$NVM_DIR/nvm.sh" ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

npm install -g tree-sitter-cli
