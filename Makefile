XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: help		# Print the help menu
help:
	@sed -n -E "s/^\.PHONY:[[:space:]]+(.*)$$/\1/p" Makefile

coc_nvim = node yarn
dependencies = nvim
dependencies += python2
dependencies += python3
dependencies += $(coc_nvim)
is_in_path = \
	if ! command -v "$(1)" > /dev/null; then \
		echo "$(1) required, but not found in PATH."; \
		exit 1; \
	fi;

.PHONY: check 		# Verify all tools required by the config are present
check:
	@echo "Checking if dependencies are present..."
	@$(foreach dependency,$(dependencies),$(call is_in_path,$(dependency)))
	@echo "...done"

.PHONY: install		# Check dependencies, setup config and install plugins
install: check configure update

.PHONY: configure	# Point Vim/NeoVim to this config
configure:
	@echo "Configuring Vim and NeoVim..."
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vim/vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	@echo "...done"

.PHONY: update		# Update plugins
update:
	@echo "Updating plugings..."
	@nvim --headless +'PlugUpdate' +'qall!'
	@echo "...done"

test_vim = \
	vim_log=$$(mktemp) ; \
	nvim -V1"$$vim_log" --headless +'checkhealth' +'qall!' 2>&1 > /dev/null ; \
	nb_of_errors=$$(grep -c ERROR "$$vim_log") ; \
	cat "$$vim_log" ; \
	echo "\nNumber of errors: $$nb_of_errors" ; \
	echo "\nVim log file: $$vim_log" ; \
	exit $(nb_of_errors) ; \

vim_log=$(shell mktemp)
vim_errors=$(shell mktemp)

fail_if_vim_error = \
	nvim -V1$(1) -i NONE --headless +'checkhealth' +'qall!' ; \
	cat $(1) ; \
	grep -e ERROR $(1) > $(2) ; \
	[ -s $(2) ] && exit 1 || exit 0

.PHONY: test		# Test configuration
test:
	@$(call fail_if_vim_error,$(vim_log),$(vim_errors))
