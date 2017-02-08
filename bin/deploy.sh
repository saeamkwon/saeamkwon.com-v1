#!/bin/sh

DIR=$(dirname "$0")

cd $DIR/..

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

echo "Deleting last build."
rm -rf public
mkdir public
cd public && git remote add origin git@github.com:minikwon/saeamkwon.com.git

echo "Checking out gh-pages branch into public"
cd public && git fetch origin/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Deploy `date`"
