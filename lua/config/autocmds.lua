-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- copy relative path + current line to system clipboard
vim.keymap.set(
  "v",
  "<leader>tt",
  [[:<C-u>let start = line("'<") | let end = line("'>") | let @+ = expand('%:p:.') . ':' . (start == end ? start : start . '-' . end) | echo @+<CR>]],
  { desc = "Copy relative file path + line range to clipboard and echo", silent = true }
)
vim.keymap.set({ "n" }, "<leader>tt", function()
  local file = vim.fn.expand("%:p:.")
  local ref = string.format("%s:%d", file, vim.fn.line("."))
  vim.fn.setreg("+", ref)
  print(ref)
end, { desc = "Copy relative file path and current line to clipboard" })

-- copy relative file path to system clipboard
vim.keymap.set("n", "<leader>tr", function()
  local path = vim.fn.expand("%:p:.")
  print(path)
  vim.fn.setreg("+", path)
end, { desc = "Copy relative file path" })

-- copy absolute file path to system clipboard
vim.keymap.set("n", "<leader>ta", function()
  local path = vim.fn.expand("%:p")
  print(path)
  vim.fn.setreg("+", path)
end, { desc = "Copy absolute file path" })
