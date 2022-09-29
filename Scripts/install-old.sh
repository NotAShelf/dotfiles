#!/bin/bash

echo "Installing specified packages"
SCRIPTDIR=$(pwd)

packages=(cat "${SCRIPTDIR}"/packages.txt)

for package in $packages
do 
  sudo pacman -S "$package" --noconfirm
done

echo "Installed all packages specified in '${packages}'"

# Check if fonts directory exists, ask the user if they want to install the fonts
if [ -d "$HOME/.local/share/fonts" ]; then
  echo "Fonts directory exists, installing fonts"
  cp -r "$HOME"/.config/install_scripts/fonts/* "$HOME"/.local/share/fonts
  echo "Installed fonts"
else
  echo "Fonts directory does not exist, do you want to create it and install the fonts? (y/n)"
  read answer
  if [ answer == "y" || $answer == "yes" ]; then
    mkdir "$HOME"/.local/share/fonts
    cp -r "$HOME"/.config/install_scripts/fonts/* "$HOME"/.local/share/fonts
    echo "Installed fonts"
  else
    echo "Not installing fonts"
  fi
fi
