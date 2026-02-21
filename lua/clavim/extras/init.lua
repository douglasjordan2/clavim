local ok, extras_list = pcall(require, "clavim.config.extras")
if not ok then return {} end

local specs = {}
for _, name in ipairs(extras_list) do
  local mod_ok, mod = pcall(require, "clavim.extras." .. name)
  if mod_ok and type(mod) == "table" then
    vim.list_extend(specs, mod)
  end
end

return specs
