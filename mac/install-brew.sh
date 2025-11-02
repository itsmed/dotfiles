#!/bin/bash

echo "🕵🏾‍♂️ Checking if x-tools is installed"
xcode-select --install 2>/dev/null || echo "✅X-Tools already installed"
echo "🕵🏾‍♂️ Checking if Homebrew is installed"
if command -v brew >/dev/null; then \
  echo "✅ $$(brew --version) installed"; \
else \
  echo "👀 Homebrew not installed, installing now"; \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
fi
if command -v brew >/dev/null; then \
  echo "✅ Homebrew installed"; \
else \
  echo "🤔 Something went wrong"; \
fi
