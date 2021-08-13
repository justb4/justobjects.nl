#!/bin/bash

# If a command fails then the deploy stops
set -e

printf "\033[0;32mGenerating...\033[0m\n"

/bin/rm -rf dist/*  > /dev/null 2>&1
mkdir -p dist

# Build the project.
# hugo - if using a theme, replace with `hugo -t <YOURTHEME>`
hugo -D -t hugo-clarity

echo "justobjects.nl" > dist/CNAME
