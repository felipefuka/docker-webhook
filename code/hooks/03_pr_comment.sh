#!/bin/bash

echo "cd ./repo/$4/$2/$3"
cd ./repo/$4/$2/$3
sleep 3
echo "gh pr review $3 -r -b '$(ls -la)'"
gh pr review $3 -r -b '$(ls -la)'
exit 0