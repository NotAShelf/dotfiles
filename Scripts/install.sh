#!/bin/bash

# If the script is ran without an argument, display the output message

# Get the name of the currently executed script
SCRIPTNAME=$(basename $0)

if [ $# -eq 0 ]; then
  echo -en "Usage:\n
              $SCRIPTNAME --install - Installs packages from the latest packages-<date>.list file.\n
              $SCRIPTNAME --backup  - Generates a list of installed packages and saves it to a file\n
              "
  exit 1
fi

if [ $1 -ne "--install"] || [ $1 -ne "--backup" ]
  echo "Invalid flag specified. Try --help to see available options"
  if [ $1 == "--help "]
	  echo -en "Usage:\n
	              $SCRIPTNAME --install - Installs packages from the latest packages-<date>.list file\n
	              $SCRIPTNAME --backup  - Generates a list of installed packages and saves it to a file\n
	              "
	  exit 1
  fi
fi


if [ "$?" -ne 0 ]; then
  read -p "An error occured. Do you still want to continue? [y/n]" answer
  if [ "$answer" == "n" ] || [ "$answer" == "N" ]; then
    echo "Aborting..."
    exit 1
  fi
fi

# If script is run with "--install" as the first argument, install the packages specified in the latest updated
# packages.list in $SCRIPTDIR
if [ "$1" == "--install" ]; then
  cd "${SCRIPTDIR}" || exit 1
  LATEST=$(ls -t packages-*.list | head -n 1)
  packages="$SCRIPTDIR"/"$LATEST"
  echo "Installing packages from '${packages}'"
  
  for package in $packages
  do
    echo "Installing '${package}'"
    sudo pacman -S '${package}' --noconfirm
  done
fi

# If script is run with "--backup" as the first argument, generate a list of installed packages and save it to
# packages-DATE.list
if [ "$1" == "--backup" ]; then
  echo "Backing up system packages"
  CURBACKUP=packages-"$(date +%y%m%d%H%M)".list
  pacman -Qe | awk '{ print $1 }' > "${CURBACKUP}"
  echo "Systems packages backed up at '${CURBACKUP}'"
fi

if [ "$1" == "--install" ] && [ "$2" == "--backup" ] || [ "$1" == "--backup" ] && [ "$2" == "--install" ]; then
  echo "You really should not be mixing any arguments. You can fuck up a packge list or install packages incorrectly."
  exit 1
fi

