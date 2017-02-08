#!/bin/sh

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

# Sets up the build directory for the first time.
mkdir build
cd build
git init
git remote add origin git@github.com:minikwon/saeamkwon.com.git

echo "Checking out gh-pages branch into build."
git fetch origin gh-pages
git checkout gh-pages
