#!/bin/bash

# bash setup-git-token.sh

echo "Choose identity: [personal, company, academic]"
read identity

echo "Paste your GitHub token for $identity:"
read -s token

case "$identity" in
  personal)
    export GITHUB_PAT_PERSONAL="$token"
    echo "Token saved in GITHUB_PAT_PERSONAL"
    ;;
  company)
    export GITHUB_PAT_COMPANY="$token"
    echo "Token saved in GITHUB_PAT_COMPANY"
    ;;
  academic)
    export GITHUB_PAT_ACADEMIC="$token"
    echo "Token saved in GITHUB_PAT_ACADEMIC"
    ;;
  *)
    echo "Invalid identity."
    ;;
esac
