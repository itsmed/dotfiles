
.PHONY: update upgrade install-packages clean

PACKAGE_LIST_FILE := brew_packages.txt

update:
	@echo "🤖 Running brew update"
	brew update

upgrade:
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
