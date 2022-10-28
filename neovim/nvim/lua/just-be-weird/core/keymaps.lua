local keymap = vim.keymap
local opts = {
    noremap = true,
    silent = true
}

----------------------
-- Keyboard / System
----------------------  
-- Remap the key used to leave insert mode
keymap.set('i', ',<LEADER>', '<Esc>')

-- Clear outs the search highlights
-- keymap.set('n', '<LEADER>nh', ':nohl<CR>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Move window
keymap.set('n', '<LEADER><Tab>', '<C-w>w')
keymap.set('n', 'sm', '<C-w>h')
keymap.set('n', 'sl', '<C-w>k')
keymap.set('n', 'sh', '<C-w>j')
keymap.set('n', 'sn', '<C-w>l')

----------------------
-- Window Split
----------------------
-- Split window horizontally
keymap.set('n', 'ss', ':split<Return><C-w>w')
-- Split window vertically
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Make split window equal width
keymap.set('n', '<LEADER>se', '<C-w>=')
-- Close the active split window
keymap.set('n', 'sx', ':close<CR>')

----------------------
-- Tab
----------------------
keymap.set('n', 'to', ':tabnew<CR>') -- New tab
keymap.set('n', 'te', ':tabedit<CR>') -- New tab
keymap.set('n', 'tx', ':tabclose<CR>') -- Close the active tab
keymap.set('n', 'tn', ':tabn<CR>') -- Go to next tab
keymap.set('n', 'tp', ':tabp<CR>') -- Go to prev tab

----------------------
-- Plugin Keybinds
----------------------
-- vim-maximizer (toggle split window maximization)
keymap.set('n', 'sm', ':MaximizerToggle<CR>')

-- nvim-tree (toggle file explorer)
keymap.set('n', '<LEADER>e', ':NvimTreeToggle<CR>')

----------------------
-- Diagnostic Override
----------------------
keymap.set('n', '<LEADER>e', vim.diagnostic.open_float, opts)
keymap.set('n', '<LEADER>q', vim.diagnostic.setloclist, opts)

----------------------
-- telescope git commands
----------------------
-- list all git commits (use <cr> to checkout) ['gc' for git commits]
keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
-- list git commits for current file/buffer (use <cr> to checkout) ['gfc' for git file commits]
keymap.set('n', '<leader>gfc', '<cmd>Telescope git_bcommits<cr>')
-- list git branches (use <cr> to checkout) ['gb' for git branch]
keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
-- list current changes per file with diff preview ['gs' for git status]
keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>')

-- Restart lsp server (not on youtube nvim video)
keymap.set('n', '<leader>rs', ':LspRestart<CR>') -- mapping to restart lsp if necessary
