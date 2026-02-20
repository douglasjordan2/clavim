return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "c", "comment", "css", "dockerfile",
          "gitignore", "go", "graphql", "html", "javascript",
          "jsdoc", "json", "lua", "make", "markdown",
          "markdown_inline", "python", "regex", "rust",
          "scss", "tsx", "typescript", "vim", "yaml",
        },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "markdown" },
        },
      })
    end,
  },
}
