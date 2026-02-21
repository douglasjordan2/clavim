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
}
