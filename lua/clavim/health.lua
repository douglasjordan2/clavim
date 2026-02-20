local M = {}

M.check = function()
  vim.health.start("ClaVim")

  if vim.fn.has("nvim-0.10") == 1 then
    vim.health.ok("Neovim >= 0.10")
  else
    vim.health.error("Neovim >= 0.10 required")
  end

  if vim.fn.executable("claude") == 1 then
    vim.health.ok("claude CLI found on PATH")
  else
    vim.health.error("claude CLI not found. Install: npm install -g @anthropic-ai/claude-code")
  end

  if vim.fn.executable("git") == 1 then
    vim.health.ok("git found")
  else
    vim.health.warn("git not found")
  end

  if vim.fn.executable("node") == 1 then
    vim.health.ok("node found (needed for some LSP servers)")
  else
    vim.health.warn("node not found (some LSP servers require it)")
  end

  local ok, _ = pcall(require, "claudecode")
  if ok then
    vim.health.ok("claudecode.nvim loaded")
  else
    vim.health.error("claudecode.nvim not loaded")
  end
end

return M
