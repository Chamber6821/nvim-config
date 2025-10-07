-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i", "v" }, "hl", "<esc>")
vim.keymap.set({ "n" }, "<leader>rs", ":NpmRun<CR>")
vim.keymap.set({ "n" }, "<leader>rk", ":NpmKillAll<CR>")
vim.keymap.del({ "n" }, "<leader>qq")
