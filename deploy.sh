#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public

git checkout master

# Add changes to git.
git add -A

# FIXME: name & email
git config --global user.name 'kadoppe'
git config --global user.email 'kadoppe@me.com'

git commit -m "Create new post"

git pull origin master

# Push source and build repos.
git push origin master

# Come Back
cd ..
