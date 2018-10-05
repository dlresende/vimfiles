XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: help
help:
	@sed -n -E 's/^\.PHONY:\s*(.+)$$/\1/p' Makefile

ale_listers = checkstyle pmd javac yamllint gometalinter
dependencies = nvim
dependencies += $(ale_linters)
check = \
	if ! command -v "$(1)" > /dev/null; then \
		echo "$(1) required, but not found in PATH."; \
		exit 1; \
	fi;

.PHONY: check-dependencies
check-dependencies:
	@echo "Checking if dependencies are present..."
	@$(foreach dependency,$(dependencies),$(call check,$(dependency)))
	@echo "...done"

.PHONY: install
install: check-dependencies configure update-plugins resolve-plugin-dependencies

.PHONY: configure
configure:
	@echo "Configuring Vim and NeoVim..."
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	@echo "...done"

.PHONY: update-plugins
update-plugins:
	@echo "Updating plugings..."
	@git submodule update --init --recursive --remote
	@echo "...done"

.PHONY: resolve-plugin-dependencies
resolve-plugin-dependencies: check-dependencies update-plugins
	@echo "Installing tools required by vim-go..."
	@nvim --headless +'GoUpdateBinaries' +'qall!'
	@echo "...done"

.PHONY: remove-submodule
remove-submodule:
	git submodule deinit -f -- $(MODULE)
	rm -fr .git/modules/$(MODULE)
	git rm -f $(MODULE)
