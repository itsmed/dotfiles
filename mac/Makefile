
.PHONY: install-brew update upgrade-packages install-packages clean

PACKAGE_LIST_FILE := brew_packages.txt

install-brew:
	@echo "🕵🏾‍♂️ Checking if x-tools is installed"
	xcode-select --install 2>/dev/null || echo "✅X-Tools already installed"
	@echo "🕵🏾‍♂️ Checking if Homebrew is installed"
	@if command -v brew >/dev/null; then \
		echo "✅ $$(brew --version) installed"; \
	else \
		echo "👀 Homebrew not installed, installing now"; \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi
	@if command -v brew >/dev/null; then \
		echo "✅ Homebrew installed"; \
	else \
		echo "🤔 Something went wrong"; \
	fi

update:
	@echo "🤖 Running brew update"
	brew update

upgrade-packages:
	@echo "🤖 Running brew upgrade"
	brew upgrade

install-packages:
	@echo "🤖 Installing Homebrew packages"
	@while IFS= read -r package; do \
		echo "🤖 Installing $$package"; \
		brew install $$package; \
	done < $(PACKAGE_LIST_FILE)

clean:
	@echo "🧹 Removing Homebrew packages not in $(PACKAGE_LIST_FILE)"
	@INSTALLED_PACKAGES=$$(brew list --formula); \
	for package in $$INSTALLED_PACKAGES; do \
		if grep -qxF "$$package" "$(PACKAGE_LIST_FILE)"; then \
			echo "🔑 Keeping $$package"; \
			continue; \
		else \
		echo "🧹 Uninstalling $$package"; \
		brew uninstall $$package; \
		fi \
	done;
	@echo "👍🏾 Sync complete."
