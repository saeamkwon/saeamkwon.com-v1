#!/bin/sh

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

# https://gohugo.io/tutorials/github-pages-blog/
echo "build" >> .gitignore

git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initialize gh-pages branch"
git push origin gh-pages
git checkout master

mkdir build
cd build
git init
git remote add origin git@github.com:minikwon/saeamkwon.com.git

echo "Checking out gh-pages branch into build."
git fetch origin gh-pages
git checkout gh-pages
