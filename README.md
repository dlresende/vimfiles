[![CI](https://github.com/dlresende/vimfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/dlresende/vimfiles/actions/workflows/ci.yml)

# Diego's Vim / Neovim Configuration

A portable, modular Vim and Neovim configuration optimized for macOS and Linux.

---

## Supported Environments

- **Editors**: Neovim (primary) and Vim
- **Operating Systems**: macOS and Linux (Windows/WSL is not supported)
- **Clipboard**: Native `+clipboard` on macOS; uses `xsel` on Linux

---

## Prerequisites

Required tools (validated via `make check`):
- `nvim` (or `vim`)
- `python3`
- `ctags` ([Universal Ctags](https://github.com/universal-ctags/ctags))
- `node`, `yarn`, and `npm`
- `gopls`

Optional language servers (configured in `coc-settings.json`): `solargraph` (Ruby), `bash-language-server` (Bash).

---

## Installation

### Automated
```sh
curl https://vimfiles.diegolemos.net/install | bash
```

### Manual
```sh
git clone git@github.com:dlresende/vimfiles.git ~/.vim
cd ~/.vim
make install
```

---

## Keybindings & Cheat Sheet

The leader key is `,` (`let mapleader=","`).

The full, auto-generated shortcut reference is maintained on the [Project Wiki](https://github.com/dlresende/vimfiles/wiki).

To export or view the cheat sheet locally, run:
```sh
make docs
```

---

## Layout

`vimrc` acts as a dispatcher that sources configuration in the following order (note that **load order is significant**):

1. `config/plug.vim` — plugin declarations (vim-plug). Must come first.
2. `config/plugin/*` — per-plugin configurations.
3. `config/basic.vim` — general editor settings.
4. `config/bindings.vim` — global key mappings.
5. `config/bindings/*.vim` — per-plugin key mappings.

Because `config/bindings.vim` is sourced *after* plugins load, a mapping defined there silently overrides a plugin's own default mapping.

Other entry points:
- `coc-settings.json` — language server configurations
- `ftplugin/*.vim` — filetype-specific settings
- `Makefile` — setup, dependency checks, test targets, and doc generation

---

## Testing

To verify the setup locally:

```sh
make check      # verify required tools are present on PATH
make install    # symlink configuration, install/update plugins
make test-nvim  # run smoke tests and checkhealth in Neovim
make test-vim   # run smoke tests in Vim
make test       # run all tests
```

CI (`.github/workflows/ci.yml`) runs the Neovim and Vim test suites in parallel on pull requests.

