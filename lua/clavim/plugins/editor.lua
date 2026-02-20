return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          jump_labels = true,
          label = { exclude = "hjkliIaArdcCvpPygSx" },
        },
        search = { enabled = false },
      },
    },
    keys = {
      { "ss", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "sw", mode = { "n", "x" }, function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Flash Word" },
      { "<leader>ss", mode = { "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    },
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    keys = {
      { ">h", function() require("mini.diff").goto_hunk("next") end, desc = "Next Hunk" },
      { "<h", function() require("mini.diff").goto_hunk("prev") end, desc = "Prev Hunk" },
      { "<leader>md", ":lua MiniDiff.toggle_overlay()<CR>", desc = "Toggle Diff Overlay", silent = true },
    },
    config = function()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.git").setup()
      require("mini.diff").setup({
        view = { style = "number", priority = 199 },
        mappings = {
          apply = "gh",
          reset = "gH",
          textobject = "gh",
          goto_first = "HH",
          goto_prev = "",
          goto_next = "",
          goto_last = "H",
        },
        options = {
          algorithm = "histogram",
          indent_heuristic = true,
          linematch = 60,
          wrap_goto = true,
        },
      })
    end,
  },
}
