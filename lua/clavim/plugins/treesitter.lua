return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash", "c", "comment", "css", "dockerfile",
        "gitignore", "go", "graphql", "html", "javascript",
        "jsdoc", "json", "lua", "make", "markdown",
        "markdown_inline", "python", "regex", "rust",
        "scss", "tsx", "typescript", "vim", "yaml",
      },
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
  },
}
