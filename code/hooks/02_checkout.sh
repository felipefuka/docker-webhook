#!/bin/sh

echo "mkdir -p /repo/$4/$2/$3"
mkdir -p ./repo/$4/$2/$3
echo "cd ./repo/$4/$2/$3"
cd ./repo/$4/$2/$
echo "gh repo clone $4"
gh repo clone $4
echo "gh pr checkout $3"
gh pr checkout $3
exit 0