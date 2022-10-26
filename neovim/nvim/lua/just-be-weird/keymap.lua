local keymap = vim.keymap
local opts = { noremap=true, silent=true }
-- local map = vim.api.nvim_set_keymap

-- [[ Keyboard / System ]]  
-- Remap the key used to leave insert mode
keymap.set('i', ',<LEADER>', '<Esc>')

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
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- [[ Window ]]  
keymap.set('n', 'ss', ':split<Return><C-w>w')  -- Split window horizontally
keymap.set('n', 'sv', ':vsplit<Return><C-w>w') -- Split window vertically

-- Move window
keymap.set('n', '<LEADER><Tab>', '<C-w>w')
keymap.set('', 'sm', '<C-w>h')
keymap.set('', 'sl', '<C-w>k')
keymap.set('', 'sh', '<C-w>j')
keymap.set('', 'sn', '<C-w>l')

-- Resize window
keymap.set('n', '<LEADER><left>', '<C-w><')
keymap.set('n', '<LEADER><right>', '<C-w>>')
keymap.set('n', '<LEADER><up>', '<C-w>+')
keymap.set('n', '<LEADER><down>', '<C-w>-')

-- [[ Tab ]]  
keymap.set('n', 'te', ':tabedit') -- New tab

-- [[ Diagnostic Override ]]  
keymap.set('n', '<LEADER>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<LEADER>q', vim.diagnostic.setloclist, opts)