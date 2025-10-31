# dotfiles directory
DOTFILES_DIR := $(shell pwd)

# target dotfiles
DOTFILES := bash_aliases bash_config bashrc vimconfig

.PHONY: all clean

all:
	@echo "Installing dotfiles $(DOTFILES_DIR)"
	@for file in $(DOTFILES); do \
		file_name=$$(echo "$$file" | tr '/' '_'); \
		echo "$$file_name"; \
		if [ -e $$HOME/.$$file_name ]; then \
			echo "Backing up existing $$HOME/.$$file_name to $$HOME/.$$file_name.bak"; \
			mv "$$HOME/.$$file_name" "$$HOME/.$$file_name.bak"; \
		fi; \
		echo "Creating symlink for $$file_name to $$HOME/.$$file_name"; \
		ln -sf "$(DOTFILES_DIR)/$$file" "$$HOME/.$$file_name"; \
	done
	@echo "Dotfiles installed"

clean:
	@rm $$HOME/.bash*
