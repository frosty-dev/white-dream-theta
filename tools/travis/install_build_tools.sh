#!/bin/bash
set -e

source dependencies.sh

if [ "$BUILD_TOOLS" = true ]; then
<<<<<<< HEAD
      rm -rf ~/.nvm && git clone https://github.com/creationix/nvm.git ~/.nvm && (cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`) && source ~/.nvm/nvm.sh && nvm install $NODE_VERSION
      pip3 install --user PyYaml -q
      pip3 install --user beautifulsoup4 -q
=======
      source ~/.nvm/nvm.sh
      nvm install $NODE_VERSION
      pip3 install --user PyYaml
      pip3 install --user beautifulsoup4
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
fi;
