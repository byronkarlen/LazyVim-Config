-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete without yanking (to black hole register)
vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "<leader>D", '"_D', { desc = "Delete to EOL without yanking" })
vim.keymap.set({ "n", "x" }, "<leader>c", '"_c', { desc = "Change without yanking" })
vim.keymap.set("n", "<leader>C", '"_C', { desc = "Change to EOL without yanking" })
