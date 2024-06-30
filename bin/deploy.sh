#!/bin/bash

#cd "$(dirname "$0")"

cd /var/www/html

# Check if cd was successful
if [ $? -ne 0 ]; then
  echo "Failed to change directory to /var/www/html"
  exit 1
fi

git stash
git pull
chmod 755 -R .

# git stash {pop}
