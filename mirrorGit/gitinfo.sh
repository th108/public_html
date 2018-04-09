#!/bin/sh

printf "Repository commit count: `git rev-list HEAD --count`\n"
#git rev-list HEAD --count
echo "Information about last commit:"
git log -1
