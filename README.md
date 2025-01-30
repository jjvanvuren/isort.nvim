# isort Plugin for Neovim

This Neovim plugin automatically sorts Python imports using [isort](https://pypi.org/project/isort/).

## Installation
First make sure `isort` is installed in your Python environment. You can install it using pip:
```sh
pip install isort
```
To install this plugin with LazyVim, add the following to your LazyVim configuration (e.g., `lua/plugins/isort.lua`):

```lua
return {
  {
    "jjvanvuren/isort.nvim",
    lazy = true,
    ft = { "python" },
    opts = {}
  },
}
```

## Configuration

The plugin can be configured with the following options:

- `sort_on_save` (boolean): If `true`, automatically sorts imports on save. Default is `true`.
- `keymap` (string): Keymap to manually sort imports. Default is `<leader>ci`.

Example configuration:
```lua
return {
  {
    "jjvanvuren/isort.nvim",
    lazy = true,
    ft = { "python" },
    opts = { sort_on_save = false, keymap = "<leader>si" }
  },
}
```

## Usage

- To manually sort imports, use the command `:Isort` or the configured keymap (default is `<leader>ci`).
- If `sort_on_save` is enabled, imports will be automatically sorted when you save a Python file.
