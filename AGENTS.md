# Working on vimfiles

- Read `README.md` for supported platforms, layout, and configuration load order.
- Preserve Vim and Neovim compatibility on macOS and Linux. Guard editor-specific
  features; Neovim is the primary target.
- Confirm whether this checkout is the installed `~/.vim` configuration before
  testing or deploying. Editing another checkout does not change the running editor.
- Preserve the load order in `vimrc`. Keep keybinding comments adjacent to their
  mappings because `make docs` extracts them.
- Keep machine-specific executable and JDK paths out of shared defaults. Leave
  platform-specific discovery in shell configuration.

## Validation

- Run `make lint` and relevant editor smoke tests for configuration changes.
- `make test-nvim` and `make test-vim` load the installed editor configuration,
  not automatically this checkout. Verify which configuration was tested.
- Editor smoke tests do not prove that language servers initialize. For language
  server changes, verify startup and inspect the client and server logs.
- `make install` changes symlinks, updates plugins, and removes unused plugins.
  Use it for installation, not as a routine validation command.

## Publishing changes

- Check the active Git hooks before pushing: `.envrc` can install a pre-push hook
  that publishes generated documentation to the project wiki. Keep wiki
  publication separate from pushing a review branch.
- Use conventional commit titles without a scope (`fix: ...`, `docs: ...`).
- Keep pull request descriptions focused on the problem and resulting behavior.
