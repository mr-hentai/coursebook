#!/bin/bash

set -e;

# Set up ssh
git config --global core.sshCommand "ssh -i /tmp/deploy_site -F /dev/null"
export DOCS_SHA=$(git rev-parse --short HEAD)

# Clone with submodules
git clone -b develop --depth 1 git@github.com:illinois-cs241/illinois-cs241.github.io.git ${CLONE_DIR}
cd ${CLONE_DIR}

git commit --allow-empty -m "Updating docs to ${DOCS_SHA}"
git push origin develop

# Go back to the build dir
cd ${TRAVIS_BUILD_DIR}
