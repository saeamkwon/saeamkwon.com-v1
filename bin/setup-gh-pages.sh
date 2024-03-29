#!/bin/sh

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

# https://gohugo.io/tutorials/github-pages-blog/
echo "build" >> .gitignore

# Sets up the gh-pages branch for the first time.
git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initialize gh-pages branch"
git push origin gh-pages
git checkout master
