#!/bin/sh

DIR=$(dirname "$0")

cd $DIR/..

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

echo "Deleting last build."
rm -rf build/*

echo "Generating site."
hugo

echo "Updating gh-pages branch"
cd build

git add --all
git commit -m "Deploy `date`"
git push

echo ""
echo "Yay, deployed! 😬"
