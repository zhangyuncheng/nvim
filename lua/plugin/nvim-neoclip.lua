local status,neoclip = pcall(require,"neoclip")
if not status then
  vim.notify("not found nvim-neoclip")
end

neoclip.setup({
  history = 1000,
  enable_persistent_history = true,
  continuous_sync = true,
  db_path = vim.fn.stdpath("data").."/databases/neoclip.sqlite3",
})
