local keymap = vim.keymap.set -- for conciseness
local status, saga = pcall(require, 'lspsaga')

if (not status) then
    return
end

saga.init_lsp_saga {
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local opts = {
    noremap = true,
    silent = true
}

-- Code action
keymap({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)

-- Rename
keymap('n', 'grn', '<cmd>Lspsaga rename<CR>', opts)

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

keymap('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)

-- Float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm<CR>', opts)

-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm lazygit<CR>', opts)

-- close floaterm
keymap('t', '<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
