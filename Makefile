XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: help				# Print the help menu
help:
	@sed -n -E "s/^\.PHONY:[[:space:]]+(.*)$$/\1/p" Makefile

ale_listers = checkstyle pmd javac yamllint gometalinter go
dependencies = nvim
dependencies += $(ale_linters)
check = \
	if ! command -v "$(1)" > /dev/null; then \
		echo "$(1) required, but not found in PATH."; \
		exit 1; \
	fi;

.PHONY: check-dependencies 		# Verify that all tools required by this Vim config are present in PATH
check-dependencies:
	@echo "Checking if dependencies are present..."
	@$(foreach dependency,$(dependencies),$(call check,$(dependency)))
	@echo "...done"

.PHONY: install				# Check for dependencies, setup Vim config and checkout plugins
install: check-dependencies configure update-plugins resolve-plugin-dependencies

.PHONY: configure			# Create shortcuts to tell Vim & NeoVim to use this config
configure:
	@echo "Configuring Vim and NeoVim..."
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	@echo "...done"

.PHONY: update-plugins			# Checkout latest version of plugins installed as submodules
update-plugins:
	@echo "Updating plugings..."
	@git submodule update --init --recursive --remote
	@echo "...done"

.PHONY: resolve-plugin-dependencies	# Run commands provided by a plugin to install dependencies they need
resolve-plugin-dependencies: check-dependencies update-plugins
	@echo "Installing tools required by vim-go..."
	@nvim --headless +'GoUpdateBinaries' +'qall!'
	@echo "...done"

.PHONY: remove-plugin			# Remove a plugin installed as a submodule: make remove-plugin MODULE=bundle/ale
remove-plugin:
	git submodule deinit -f -- $(MODULE)
	rm -fr .git/modules/$(MODULE)
	git rm -f $(MODULE)
