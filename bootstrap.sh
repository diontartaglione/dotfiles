#!/bin/zsh

# Dotfiles bootstrap script

# Set the path to the symlinks file
symlinks_file="$PWD/symlinks"

# Read the symlinks file line by line
while IFS='|' read -r source_path target_path || [[ -n "$source_path" ]]; do
  # Trim leading/trailing whitespace from paths
  source_path=$(echo -e "${source_path}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  target_path=$(echo -e "${target_path}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # Check if the source file/directory exists
  if [ -e "$HOME/$source_path" ]; then
    ln -s "$HOME/$source_path" "$HOME/$target_path"
    echo "Created symbolic link: $HOME/$target_path"
  else
    echo "Error: Source file/directory does not exist: $HOME/$source_path. Skipping symbolic link creation."
  fi
done <"$symlinks_file"
