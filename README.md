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
