#!/bin/bash

# bash git-clone-token.sh company UkubonaLLC/signal-noise-toolkit

identity=$1
repo=$2             # e.g. UkubonaLLC/signal-noise-toolkit
folder=$3           # optional

if [ -z "$identity" ] || [ -z "$repo" ]; then
  echo "Usage: ./git-clone-token.sh [identity] [user/repo] [optional-folder-name]"
  exit 1
fi

# Pull token
case "$identity" in
  personal)
    token=$GITHUB_PAT_PERSONAL
    email="abikesa.sh@gmail.com"
    name="Zeus"
    ;;
  company)
    token=$GITHUB_PAT_COMPANY
    email="ukubona-llc@gmail.com"
    name="CEO"
    ;;
  academic)
    token=$GITHUB_PAT_ACADEMIC
    email="jhurepos@gmail.com"
    name="Instructor"
    ;;
  *)
    echo "Invalid identity."
    exit 1
    ;;
esac

# Clone
git clone https://$token@github.com/$repo.git $folder

# Move in
cd ${folder:-$(basename "$repo")} || exit

# Set identity
git config user.name "$name"
git config user.email "$email"

echo "Cloned and configured repo with $identity identity."
