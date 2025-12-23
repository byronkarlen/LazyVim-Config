-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete without yanking (to black hole register)
vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "<leader>D", '"_D', { desc = "Delete to EOL without yanking" })
vim.keymap.set({ "n", "x" }, "<leader>c", '"_c', { desc = "Change without yanking" })
vim.keymap.set("n", "<leader>C", '"_C', { desc = "Change to EOL without yanking" })

-- copy relative file path + visual line range to system clipboard
vim.keymap.set("v", "<leader>yy", function()
  local l1 = vim.fn.line("v") -- visual anchor
  local l2 = vim.fn.line(".") -- cursor

  local start_line = math.min(l1, l2)
  local end_line = math.max(l1, l2)

  local path = vim.fn.expand("%:p:.")
  if path == "" then
    return
  end

  local ref
  if start_line == end_line then
    ref = path .. ":" .. start_line
  else
    ref = path .. ":" .. start_line .. "-" .. end_line
  end

  vim.fn.setreg("+", ref)

  vim.notify(ref, vim.log.levels.INFO, { title = "Copied" })

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end, {
  desc = "Copy relative file path + line range",
  silent = true,
})

-- copy relative file path to system clipboard
vim.keymap.set("n", "<leader>yy", function()
  local path = vim.fn.expand("%:p:.")
  vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
  vim.fn.setreg("+", path)
end, { desc = "Copy relative file path" })

-- copy absolute file path to system clipboard
vim.keymap.set("n", "<leader>yz", function()
  local path = vim.fn.expand("%:p")
  vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
  vim.fn.setreg("+", path)
end, { desc = "Copy absolute file path" })
