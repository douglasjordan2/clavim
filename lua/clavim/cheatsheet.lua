local M = {}

local groups = {
  {
    name = "AI",
    mappings = {
      { "<leader>ac", "Toggle Chat" },
      { "<leader>as", "Send Prompt" },
      { "<leader>ax", "Send with Context" },
      { "<leader>av", "Send Selection" },
      { "<leader>ae", "Inline Edit" },
      { "<leader>aa", "Abort" },
      { "<leader>al", "Sessions" },
      { "<leader>ay", "Accept Diff" },
      { "<leader>an", "Reject Diff" },
    },
  },
  {
    name = "Find",
    mappings = {
      { "<leader>ff", "Find Files" },
      { "<leader>fw", "Grep" },
      { "<leader>fW", "Grep Word" },
      { "<leader>fr", "Resume" },
      { "<leader>fh", "Help" },
      { "<leader>fk", "Keymaps" },
      { "<leader>/", "Buffer Lines" },
      { "<leader>fo", "LSP Symbols" },
      { "<leader>b", "Buffers" },
    },
  },
  {
    name = "Git",
    mappings = {
      { "<leader>gc", "Git Log" },
      { "<leader>gb", "Blame Line" },
      { "<leader>gB", "Browse" },
      { "<leader>fd", "Diff" },
      { "<leader>md", "Diff Overlay" },
      { ">h", "Next Hunk" },
      { "<h", "Prev Hunk" },
      { "gh", "Apply Hunk" },
      { "gH", "Reset Hunk" },
    },
  },
  {
    name = "LSP",
    mappings = {
      { "gd", "Definition" },
      { "gr", "References" },
      { "gI", "Implementation" },
      { "gy", "Type Definition" },
      { "K", "Hover" },
      { "<C-k>", "Signature Help" },
      { "<leader>ca", "Code Action" },
      { "<leader>cd", "Diagnostic Float" },
      { "<leader>ra", "Rename" },
      { "<leader>cf", "Format" },
      { "<leader>cR", "Rename File" },
    },
  },
  {
    name = "Diagnostics",
    mappings = {
      { "[d", "Prev Diagnostic" },
      { "]d", "Next Diagnostic" },
      { "<leader>xx", "Diagnostics" },
      { "<leader>xX", "Buffer Diagnostics" },
      { "<leader>cs", "Symbols" },
      { "<leader>xQ", "Quickfix" },
    },
  },
  {
    name = "Editor",
    mappings = {
      { "ss", "Flash" },
      { "sw", "Flash Word" },
      { "<leader>ss", "Flash Treesitter" },
      { "<leader>s", "Save" },
      { "<leader>qq", "Quit All" },
      { "<leader>ll", "Format" },
      { "<leader>.", "Scratch Buffer" },
      { "<leader>;", "Terminal" },
      { "<leader>e", "Explorer" },
      { "-", "File Manager (Oil)" },
    },
  },
  {
    name = "Toggle",
    mappings = {
      { "<leader>us", "Spelling" },
      { "<leader>uw", "Wrap" },
      { "<leader>uL", "Relative Number" },
      { "<leader>ud", "Diagnostics" },
      { "<leader>ul", "Line Numbers" },
      { "<leader>uT", "Treesitter" },
      { "<leader>uh", "Inlay Hints" },
      { "<leader>un", "Dismiss Notifs" },
    },
  },
  {
    name = "Windows",
    mappings = {
      { "<leader><Down>", "Split Below" },
      { "<leader><Right>", "Split Right" },
      { "<Left>", "Window Left" },
      { "<Right>", "Window Right" },
      { "<Up>", "Window Up" },
      { "<Down>", "Window Down" },
      { "<leader>=", "Equalize" },
    },
  },
  {
    name = "Clipboard",
    mappings = {
      { "<leader>y", "Yank" },
      { "<leader>Y", "Yank Line" },
      { "<leader>p", "Paste" },
      { "<leader>P", "Paste Before" },
    },
  },
}

local function pad(s, w)
  if #s >= w then return s:sub(1, w) end
  return s .. string.rep(" ", w - #s)
end

function M.open()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.max(72, math.min(vim.o.columns - 4, 88))
  local key_w = 16
  local entry_w = math.floor((width - 2) / 2)
  local desc_w = entry_w - key_w - 1

  local lines = {}
  local hls = {}

  local function add_hl(line, col, len, group)
    table.insert(hls, { line, col, col + len, group })
  end

  local title = "Clavim Cheatsheet"
  local title_pad = math.floor((width - #title) / 2)
  table.insert(lines, "")
  table.insert(lines, string.rep(" ", title_pad) .. title)
  add_hl(#lines - 1, title_pad, #title, "ClavimCheatsheetHeader")
  table.insert(lines, "")

  for _, group in ipairs(groups) do
    local sep_len = math.max(0, width - #group.name - 2)
    local header = " " .. group.name .. " " .. string.rep("─", sep_len)
    table.insert(lines, header)
    add_hl(#lines - 1, 0, #header, "ClavimCheatsheetGroup")

    local mappings = group.mappings
    for i = 1, #mappings, 2 do
      local m1 = mappings[i]
      local left = " " .. pad(m1[1], key_w) .. pad(m1[2], desc_w)
      local line = left

      if mappings[i + 1] then
        local m2 = mappings[i + 1]
        line = line .. " " .. pad(m2[1], key_w) .. m2[2]
      end

      table.insert(lines, line)
      local ln = #lines - 1

      add_hl(ln, 1, #m1[1], "ClavimCheatsheetKey")
      add_hl(ln, 1 + key_w, #m1[2], "ClavimCheatsheetDesc")

      if mappings[i + 1] then
        local m2 = mappings[i + 1]
        local right_start = #left + 1
        add_hl(ln, right_start, #m2[1], "ClavimCheatsheetKey")
        add_hl(ln, right_start + key_w, #m2[2], "ClavimCheatsheetDesc")
      end
    end

    table.insert(lines, "")
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace("clavim_cheatsheet")
  for _, hl in ipairs(hls) do
    vim.api.nvim_buf_add_highlight(buf, ns, hl[4], hl[1], hl[2], hl[3])
  end

  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].buftype = "nofile"

  local height = math.min(#lines, vim.o.lines - 4)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
    title = " Clavim ",
    title_pos = "center",
  })

  vim.api.nvim_set_hl(0, "ClavimCheatsheetHeader", { bold = true, fg = "#81A1C1" })
  vim.api.nvim_set_hl(0, "ClavimCheatsheetGroup", { bold = true, fg = "#88C0D0" })
  vim.api.nvim_set_hl(0, "ClavimCheatsheetKey", { bold = true, fg = "#EBCB8B" })
  vim.api.nvim_set_hl(0, "ClavimCheatsheetDesc", { fg = "#D8DEE9" })

  local close = function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
  vim.keymap.set("n", "q", close, { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, silent = true })
  vim.keymap.set("n", "<CR>", close, { buffer = buf, silent = true })
end

return M
