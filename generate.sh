#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mGenerating...\033[0m\n"

/bin/rm -rf docs/*  > /dev/null 2>&1
mkdir -p docs
echo "nl.justobjects.org" > docs/CNAME

# Build the project.
# hugo - if using a theme, replace with `hugo -t <YOURTHEME>`
hugo -D -t hugo-clarity
