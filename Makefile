.PHONY: help
help:
	@sed -n -E 's/^\.PHONY:\s*(.+)$$/\1/p' Makefile

dependencies = checkstyle pmd javac yamllint gometalinter
check_dependency = \
	if ! command -v "$(1)" > /dev/null; then \
		echo "$(1) required, but not found in PATH."; \
		exit 1; \
	fi;

.PHONY: check-dependencies
check-dependencies:
	@echo "Checking if dependencies are present..."
	@$(foreach dependency,$(dependencies),$(call check_dependency,$(dependency)))
	@echo "...done"

.PHONY: install
install: check-dependencies update-plugins
	@echo "Installing tools required by vim-go..."
	@nvim --headless +'GoUpdateBinaries' +'qall!'
	@echo "...done"

.PHONY: update-plugins
update-plugins:
	@echo "Updating plugings..."
	@git submodule update --init --recursive --remote
	@echo "...done"
