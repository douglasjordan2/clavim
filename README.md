# ClaVim

AI-native Neovim distro. Cursor features, terminal speed.

```
     ██████╗██╗      █████╗ ██╗   ██╗██╗███╗   ███╗
    ██╔════╝██║     ██╔══██╗██║   ██║██║████╗ ████║
    ██║     ██║     ███████║██║   ██║██║██╔████╔██║
    ██║     ██║     ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ╚██████╗███████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
     ╚═════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
```

![demo](demo.gif)

ClaVim is an opinionated Neovim distribution built around [claudecode.nvim](https://github.com/douglasjordan2/claudecode.nvim) — bringing Cursor-like AI editing to Neovim with no API key required. Just your Claude Pro/Max subscription.

## Install

### Prerequisites

- Neovim >= 0.10
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) (`npm install -g @anthropic-ai/claude-code`)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

### Quick start

```bash
git clone https://github.com/douglasjordan2/clavim ~/.config/clavim
NVIM_APPNAME=clavim nvim
```

Plugins install automatically on first launch.

> **Note:** `NVIM_APPNAME=clavim` runs ClaVim alongside your existing Neovim config without conflicts. Add `alias clavim='NVIM_APPNAME=clavim nvim'` to your shell rc for convenience.

### Health check

```
:checkhealth clavim
```

## Cursor Parity

| Cursor Feature | ClaVim | Keymap |
|---|---|---|
| Chat sidebar | Split panel with streaming | `<leader>ac` |
| Cmd+K inline edit | Visual select + instruct | `<leader>ae` (visual) |
| Accept/reject diffs | Inline diff with extmarks | `<leader>ay` / `<leader>an` |
| @file context | Send file + diagnostics | `<leader>ax` |
| @selection context | Send visual selection | `<leader>av` (visual) |
| Session history | Resume prior conversations | `<leader>al` |
| .cursorrules | `CLAUDE.md` (native to CLI) | — |
| Codebase-aware answers | Claude CLI reads your project | Built-in |
| Multi-file edits | Claude CLI handles natively | Built-in |

## Keymaps

Press `<leader>` and wait to see all available commands via which-key.

### AI (Claude) — `<leader>a`

| Key | Action |
|---|---|
| `<leader>ac` | Toggle chat panel |
| `<leader>as` | Focus input / send prompt |
| `<leader>ax` | Send with file context + diagnostics |
| `<leader>av` | Send visual selection (visual mode) |
| `<leader>ae` | Inline edit selection (visual mode) |
| `<leader>aa` | Abort current request |
| `<leader>al` | Browse/resume sessions |
| `<leader>ay` | Accept pending diff |
| `<leader>an` | Reject pending diff |

### Find — `<leader>f`

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fw` | Grep (live search) |
| `<leader>fW` | Grep word under cursor |
| `<leader>fr` | Resume last picker |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fd` | Git diff hunks |
| `<leader>fo` | LSP symbols |

### Git — `<leader>g`

| Key | Action |
|---|---|
| `<leader>gb` | Blame current line |
| `<leader>gB` | Open in browser |
| `<leader>gc` | Git log |
| `>h` | Next hunk |
| `<h` | Previous hunk |
| `<leader>md` | Toggle diff overlay |

### Diagnostics — `<leader>x`

| Key | Action |
|---|---|
| `<leader>xx` | Toggle diagnostics panel |
| `<leader>xX` | Buffer diagnostics only |
| `<leader>xQ` | Quickfix list |

### Editor

| Key | Action |
|---|---|
| `<leader>s` | Save |
| `<leader>qq` | Quit all |
| `-` | Open file browser (Oil) |
| `<leader>e` | File explorer (Snacks) |
| `<leader>;` | Toggle terminal |
| `<leader>b` | Buffer picker |
| `<leader>.` | Scratch buffer |
| `ss` | Flash jump |
| `sw` | Flash to word under cursor |
| `K` | Hover docs |
| `gd` | Go to definition |
| `gr` | References |
| `<leader>ca` | Code action |
| `<leader>ra` | Rename symbol |

## Plugins (15)

| Plugin | Role |
|---|---|
| [claudecode.nvim](https://github.com/douglasjordan2/claudecode.nvim) | AI chat, inline edit, diff review |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, picker, terminal, explorer, notifications |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap discovery popups |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | TypeScript (auto-imports, inlay hints) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting + indent |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Surround, pairs, git, diff |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump motions |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics panel |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File browser |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline (with Claude status) |
| [onenord.nvim](https://github.com/rmehri01/onenord.nvim) | Colorscheme (dark, true black) |

## Structure

```
clavim/
  init.lua                        # Bootstrap + lazy.nvim setup
  lua/clavim/
    health.lua                    # :checkhealth clavim
    config/
      options.lua                 # Editor defaults
      keymaps.lua                 # Global keybindings
      autocmds.lua                # Autocommands
    plugins/
      ai.lua                     # claudecode.nvim
      completion.lua              # nvim-cmp + LuaSnip
      editor.lua                  # flash, mini.nvim (surround, pairs, git, diff)
      lsp.lua                    # lspconfig + mason + typescript-tools
      theme.lua                   # onenord colorscheme
      treesitter.lua              # Treesitter + parsers
      ui.lua                     # snacks, lualine, trouble, oil, colorizer
      which-key.lua               # Keymap discovery
```

## Philosophy

1. **AI is first-class** — chat, inline edit, and diff review are core to the workflow, not afterthoughts
2. **Opinionated but escapable** — sane defaults, everything overridable
3. **No API key needed** — runs on your Claude Pro/Max subscription via the CLI
4. **Lean** — 15 plugins, nothing wasted

## License

MIT
