return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      animate = {
        duration = 20,
        easing = "linear",
        fps = 60,
      },
      scratch = {
        ft = function() return "markdown" end,
      },
      styles = {
        notification = { wo = { wrap = true } },
      },
      dashboard = {
        preset = {
          header = table.concat({
            "     ██████╗██╗      █████╗ ██╗   ██╗██╗███╗   ███╗",
            "    ██╔════╝██║     ██╔══██╗██║   ██║██║████╗ ████║",
            "    ██║     ██║     ███████║██║   ██║██║██╔████╔██║",
            "    ██║     ██║     ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "    ╚██████╗███████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "     ╚═════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "",
            "              AI-native Neovim. Cursor speed.",
          }, "\n"),
          keys = {
            { icon = "󰭎 ", key = "a", desc = "Claude Chat", action = ":Claude" },
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
            { icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.picker.grep()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
            { icon = "󰋠 ", key = "h", desc = "Health Check", action = ":checkhealth clavim" },
            { icon = " ", key = "?", desc = "Cheatsheet", action = ":ClavimCheatsheet" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
          },
          { section = "startup" },
          { text = "Press ? for keybindings · <leader> to explore", align = "center", hl = "Comment", padding = 1 },
        },
      },
      picker = {
        prompt = " ",
        ui_select = true,
        layout = {
          cycle = true,
          preset = function()
            return vim.o.columns >= 120 and "default" or "vertical"
          end,
        },
      },
    },
    keys = {
      { "<leader>b", function() Snacks.picker.buffers({ sort_lastused = true, current = false }) end, desc = "Buffers" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep Selection", mode = "x" },
      { "<leader>fW", function() Snacks.picker.grep_word() end, desc = "Grep Word" },
      { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume Picker" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fd", function() Snacks.picker.git_diff() end, desc = "Git Diff" },
      { "<leader>fo", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Scratch Buffer" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
      { "<leader>cR", function() Snacks.rename() end, desc = "Rename File" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          _G.dd = function(...) Snacks.debug.inspect(...) end
          _G.bt = function() Snacks.debug.backtrace() end
          vim.print = _G.dd

          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.inlay_hints():map("<leader>uh")
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_x = { "claudecode", "encoding", "fileformat", "filetype" },
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { focus = true },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
    },
  },

  { "NvChad/nvim-colorizer.lua", event = "BufReadPost", config = true },
}
