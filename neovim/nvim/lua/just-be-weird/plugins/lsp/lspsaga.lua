local keymap = vim.keymap.set
local status, saga = pcall(require, 'lspsaga')

if (not status) then
    return
end

saga.init_lsp_saga {
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local keymap = vim.keymap -- for conciseness

local opts = {
    noremap = true,
    silent = true
}

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump
keymap('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)

-- Code action
keymap({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)

-- Rename
keymap('n', 'grn', '<cmd>Lspsaga rename<CR>', opts)

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)

-- Show line diagnostics
keymap('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
-- Show cursor diagnostic
keymap('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)

-- Diagnsotic jump can use `<c-o>` to jump back
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Only jump to error
keymap('n', '[E', function()
    require('lspsaga.diagnostic').goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end, opts)
keymap('n', ']E', function()
    require('lspsaga.diagnostic').goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end, opts)

-- Outline Toggle
keymap('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)

-- Hover Doc
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

keymap('n', 'grn', '<Cmd>Lspsaga rename<CR>', opts)

-- Float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm<CR>', opts)

-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm lazygit<CR>', opts)

-- close floaterm
keymap('t', '<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)