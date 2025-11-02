#!/bin/bash

echo "🕵🏾‍♂️ Checking if x-tools is installed"
xcode-select --install 2>/dev/null || echo "✅X-Tools already installed"
echo "🕵🏾‍♂️ Checking if Homebrew is installed"
if command -v brew >/dev/null; then
  echo "✅ $$(brew --version) installed";
else \
  echo "👀 Homebrew not installed, installing now";
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi
if command -v brew >/dev/null; then
  echo "✅ Homebrew installed";
else
  echo "🤔 Something went wrong";
  exit 0;
fi

echo "🤖 Installing Homebrew packages"
pkgfile="$(pwd)/brew_packages.txt"
while IFS= read -r package || [ -n "$package" ]; do
  # strip comments and surrounding whitespace
  package="${package%%#*}"
  package="${package#"${package%%[![:space:]]*}"}"  # ltrim
  package="${package%"${package##*[![:space:]]}"}"  # rtrim
  [ -z "$package" ] && continue

  echo "🤖 Installing $package"
  brew install "$package"
done < "$pkgfile"
