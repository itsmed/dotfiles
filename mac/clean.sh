#!/bin/bash

PACKAGE_LIST_FILE="$(pwd)/brew_packages.txt"

echo "🧹 Removing Homebrew packages not in $PACKAGE_LIST_FILE"
INSTALLED_PACKAGES=$(brew list --formula)
for package in $INSTALLED_PACKAGES; do
  if grep -qxF "$package" "$PACKAGE_LIST_FILE"; then
    echo "🔑 Keeping $package"
    continue
  else
    echo "🧹 Uninstalling $package"
    brew uninstall "$package"
  fi
done
echo "👍🏾 Sync complete."
