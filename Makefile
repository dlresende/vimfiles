XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: help				# Print the help menu
help:
	@sed -n -E "s/^\.PHONY:[[:space:]]+(.*)$$/\1/p" Makefile

ale_linters = yamllint eslint
lang_servers_deps = javac java gem
# lang_servers += bash-language-server # https://github.com/mads-hartmann/bash-language-server/issues/141
markdown_preview_deps = node yarn
dependencies = nvim
dependencies += python2
dependencies += python3
dependencies += $(ale_linters)
dependencies += $(markdown_preview_deps)
dependencies += $(lang_servers_deps)
dependencies += $(lang_servers)
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
install: check-dependencies configure resolve-plugin-dependencies

.PHONY: configure			# Create shortcuts to tell Vim & NeoVim to use this config
configure:
	@echo "Configuring Vim and NeoVim..."
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vim/vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	@echo "...done"

.PHONY: update-plugins			# Checkout latest version of plugins installed as submodules
update-plugins:
	@echo "Updating plugings..."
	@git submodule update --init --recursive --remote
	@echo "...done"

.PHONY: resolve-plugin-dependencies	# Run commands provided by a plugin to install dependencies they need
resolve-plugin-dependencies: check-dependencies
	@yarn --cwd $(HOME)/.vim/bundle/markdown-preview.nvim install
	@(cd $(HOME)/.vim/vendor/eclipse.jdt.ls && ./mvnw --batch-mode clean package)
	@(python2 -m pip uninstall --yes neovim pynvim ; python2 -m pip install --user --upgrade pynvim)
	@(python3 -m pip uninstall --yes neovim pynvim ; python3 -m pip install --user --upgrade pynvim)
	@(GO111MODULE=on go get golang.org/x/tools/gopls@latest)
	@(gem install solargraph)

.PHONY: remove-plugin			# Remove a plugin installed as a submodule: make remove-plugin MODULE=bundle/ale
remove-plugin:
	git submodule deinit -f -- $(MODULE)
	rm -fr .git/modules/$(MODULE)
	git rm -f $(MODULE)

test_vim = \
	vim_log=$$(mktemp) ; \
	nvim -V1"$$vim_log" --headless +'checkhealth' +'qall!' 2>&1 > /dev/null ; \
	nb_of_errors=$$(grep ERROR "$$vim_log" | wc -l | xargs) ; \
	echo "\nNumber of errors: $$nb_of_errors" ; \
	echo "\nVim log file: $$vim_log" ; \
	cat "$$vim_log" ; \
	exit $(nb_of_errors) ; \

.PHONY: test	# Test Neovim configuration
test:
	@$(call test_vim)
