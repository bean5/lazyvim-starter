-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tabs and indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2

-- Ctrl + tabs to nav between recent buffers
vim.keymap.set("n", "<C-Tab>", ":b#<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Tab>", ":b#<CR>", { noremap = true, silent = true })

-- Move tab over (Ctrl + Shift + Page Up/Down)
vim.keymap.set("n", "<C-S-PageDown>", ":tabmove -1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-PageUp>", ":tabmove +1<CR>", { noremap = true, silent = true })

-- Switch to next tab (Ctrl + Page Up/Down)
-- vim.keymap.set("n", "<C-PageDown>", ":tabn<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-PageUp>", ":tabp<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-t>", ":tabnew | :tabp<CR>", { noremap = true, silent = true })
-- Reopen closed tab (Ctrl + Shift + t)

-- Close tab - bring up file finder in place of it
vim.keymap.set("n", "<C-b>", function()
  -- Check if there's more than one window open in the tab
  if vim.fn.winnr("$") == 1 then
    -- If only one window is left, toggle file finder
    vim.cmd("Explore")
  else
    -- Otherwise, quit the current window
    vim.cmd("q!")
  end
end, { noremap = true, silent = true })

-- Ctrl + d or w to close file without save
vim.keymap.set("n", "<C-d>", ":bd!<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<C-w>", ":bd!<CR>", { noremap = true, silent = true })

-- Ctrl + shift + t to reopen a buffer
vim.keymap.set("n", "<C-S-oset nobackup>", ":e!<CR>", { noremap = true, silent = true })

-- Ctrl + q to quit Neovim (close entire session)
vim.keymap.set("n", "<C-q>", ":qa!<CR>", { noremap = true, silent = true })

-- Ctrl + j to open terminal
-- vim.keymap.set("n", "<C-j>", ":belowright split | terminal zsh", { noremap = true, silent = true })

-- This avoids Neovim doing atomic writes that might not trigger file watchers:
-- vim.o.autoread = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
  pattern = "*",
})
