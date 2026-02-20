return {
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onenord").setup({
        theme = "dark",
        disable = { background = false },
        custom_highlights = {
          dark = {
            Normal = { bg = "#000" },
            NormalNC = { bg = "#000" },
          },
        },
      })
    end,
  },
}
