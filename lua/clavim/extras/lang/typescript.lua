return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/cmp-nvim-lsp" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          tsserver_format_options = {
            indentSize = 2,
            tabSize = 2,
            convertTabsToSpaces = true,
          },
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeCompletionsForModuleExports = true,
            includeCompletionsWithInsertText = true,
            includeAutomaticOptionalChainCompletions = true,
          },
          expose_as_code_action = "all",
        },
      })
    end,
  },
}
