return {
  {
    "douglasjordan2/claudecode.nvim",
    build = ":lua require('claudecode.build').install()",
    lazy = false,
    config = function()
      require("claudecode").setup({
        ui = { mode = "split" },
        keymaps = {
          toggle = "<leader>ac",
          send = "<leader>as",
          context = "<leader>ax",
          visual = "<leader>av",
          inline_edit = "<leader>ae",
          abort = "<leader>aa",
          accept_diff = "<leader>ay",
          reject_diff = "<leader>an",
          sessions = "<leader>al",
        },
      })
    end,
  },
}
