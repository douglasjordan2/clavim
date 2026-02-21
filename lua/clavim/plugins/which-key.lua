return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      icons = {
        breadcrumb = ">>",
        separator = "->",
        group = "+ ",
      },
      spec = {
        { "<leader>a", group = "AI (Claude)" },
        { "<leader>ac", desc = "Toggle Chat" },
        { "<leader>as", desc = "Send Prompt" },
        { "<leader>ax", desc = "Send with Context" },
        { "<leader>av", desc = "Send Selection", mode = "v" },
        { "<leader>ae", desc = "Inline Edit", mode = "v" },
        { "<leader>aa", desc = "Abort" },
        { "<leader>al", desc = "Sessions" },
        { "<leader>ay", desc = "Accept Diff" },
        { "<leader>an", desc = "Reject Diff" },

        { "<leader>?", desc = "Cheatsheet" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>u", group = "Toggle" },
        { "<leader>c", group = "Code" },
        { "<leader>cd", desc = "Diagnostic Float" },
      },
    },
  },
}
