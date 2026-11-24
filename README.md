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
- `nvim` (installation uses Neovim even when Vim is your daily editor)
- `python3`
- `ctags` ([Universal Ctags](https://github.com/universal-ctags/ctags))
- `node` and `yarn`
- `gopls`
- `bash-language-server` and `solargraph` (Ruby)
- `ruff` and `shellcheck`
- `xsel` on Linux

Plugin installation also uses `npm`. Java support requires a compatible JDK
(Java 25 in CI) and an exported `JAVA_HOME`. These are not checked by `make check`.

---

## Installation

### Java language support

Export `JAVA_HOME` from your shell configuration before starting Vim or Neovim.
It must point to a JDK compatible with the server bundled with coc-java (Java 25
for the currently tested bundle). CoC expands `${env:JAVA_HOME}` in
`coc-settings.json`, so JDK discovery belongs in your shell configuration rather
than in machine-specific editor settings. An unset `JAVA_HOME` leaves the
placeholder unresolved and prevents Java support from starting.

Check `:echo $JAVA_HOME` in the editor, run `:CocRestart`, and open a Java file.
Use `:CocCommand java.open.clientLog` to confirm the JDK used to launch the server.
Projects targeting another Java version can use `java.configuration.runtimes`;
the server's launch JDK and the project's JDK are separate settings.

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

After installation, verify the setup locally:

```sh
make check      # verify required tools are present on PATH
make lint       # check Vim script, shell scripts, and JSON
make test-nvim  # run smoke tests and checkhealth in Neovim
make test-vim   # run smoke tests in Vim
make test       # run both editor suites
make test-java  # verify coc-java initializes (requires JAVA_HOME and built plugins)
```

The editor smoke tests load the installed configuration, so editing another
checkout does not automatically test those changes. `make install` changes
symlinks, updates plugins, and removes unused plugins; it is an installation
step rather than a routine validation command.

`make test-java` reads `coc-settings.json` from the current checkout and loads
the installed coc.nvim and coc-java plugins from `~/.vim/plugged` (override with
`VIMFILES_PLUGIN_DIR`). It uses a temporary home, CoC data directory, and Java
file, waits up to three minutes for the Java service to finish initialization,
and prints logs on failure. It does not verify project imports or builds.

CI (`.github/workflows/ci.yml`) runs the Neovim and Vim test suites in parallel
on pull requests and checks Java language-server initialization with Java 25
in the Neovim job.

