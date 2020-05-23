#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo server --disableFastRender -t academic # if using a theme, replace with `hugo -t <YOURTHEME>`

