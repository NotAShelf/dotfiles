#!/bin/bash


# Get the name of the currently executed script
SCRIPTNAME=$(basename "$0")
# Get the directory of the currently executed script
SCRIPTDIR=$(pwd)
# Find an AUR helper to install packages
if [ "$(command -v yay)" ]; then
  HELPER="yay"
elif [ "$(command -v paru)" ]; then
  HELPER="paru"
else
  echo ":: No AUR helper found. Exiting..."
  exit 0
fi

# If the script is ran without an argument, display the output message
if [ $# -eq 0 ]; then
  echo -en "Usage:\n
              $SCRIPTNAME --install - Installs packages from the latest packages-<date>.list file.\n
              $SCRIPTNAME --backup  - Generates a list of installed packages and saves it to a file\n
              $SCRIPTNAME --apply   - Applies the current files in .config to ~/.config\n
              "
  exit 1
fi

if [ "$1" != "--install" ] && [ "$1" != "--backup" ] && [ "$1" != "--apply" ]; then
  echo "Invalid flag specified. Try --help to see available options"
  if [ "$1" == "--help" ]; then
	  echo -en "Usage:\n
	              $SCRIPTNAME --install - Installs packages from the latest packages-<date>.list file\n
	              $SCRIPTNAME --backup  - Generates a list of installed packages and saves it to a file\n
                $SCRIPTNAME --apply   - Applies the current files in .config to ~/.config\n
	              "
	  exit 1
  fi
fi

# if multiple arguments are passed, exit "gracefully"
if [ $# -gt 1 ]; then
  echo "Too many arguments. Try --help to see available options"
  exit 1
fi

# if an error code is emitted, ask if the user wants to continue
if [ "$?" -ne 0 ]; then
  read -rp "An error occured. Do you still want to continue? [y/n]" answer
  case $answer in
    y|Y) echo "Continuing...";;
    n|N) echo "Exiting..."; exit 1;;
    *) echo "Invalid input. Exiting..."; exit 1;;
  esac
fi

# If script is run with "--install" as the first argument, install the packages specified in the latest updated
# packages.list in $SCRIPTDIR
if [ "$1" == "--install" ]; then
  cd "${SCRIPTDIR}" || exit 1
  LATEST=$(ls -t packages-*.list | head -n 1)
  packages=$(cat "$SCRIPTDIR"/"$LATEST")
  echo "Installing packages from '${packages}'"

  if ! pacman -Qq "$(cat "$SCRIPTDIR"/packages-*.list)" >/dev/null 2>&1; then
    echo "Installing packages..."
    for package in $packages
    do
      echo "Installing '$package'"
      sudo ${HELPER} -S '$package' --noconfirm
    done
  fi
fi

# If the script is run with "--apply" as the first argument, list all files in .config and override ~/.config with them
# in $SCRIPTDIR
if [ "$1" == "--apply" ]; then
  FILES=$(tree -if "${SCRIPTDIR}"/.config)

  for file in $FILES
  do
    echo "Copying '${file}' to ~/.config"
    diff -q "${file}" ~/.config/"${file}"
    cp -rv "${file}" ~/.config
  done

fi

# If script is run with "--backup" as the first argument, generate a list of installed packages and save it to
# packages-DATE.list
if [ "$1" == "--backup" ]; then
  echo "Generating list of installed packages..."
  # Set CURBACKUP as packages-YYDDMMHHMM.list
  CURBACKUP="packages-$(date +%y%d%m%H%M).list"
  # Generate a list of installed packages and save it to $CURBACKUP
  pacman -Qqe > "${SCRIPTDIR}"/"${CURBACKUP}"
  echo "Systems packages backed up at '${CURBACKUP}'"
fi
