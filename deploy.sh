#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public

git checkout master

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
  fi

  # FIXME: name & email
  git config --global user.name 'kadoppe'
  git config --global user.email 'kadoppe@me.com'

  git commit -m "$msg"

  # Push source and build repos.
  git push origin master

  # Come Back
  cd ..
