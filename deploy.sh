#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# checkout submodule's master branch
cd public
git checkout master
cd ..

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"

# FIXME: name & email
git config --global user.name 'kadoppe'
git config --global user.email 'kadoppe@me.com'

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

# Commit and push submodule update
git add -A
git commit -m "$msg"

git push origin master
