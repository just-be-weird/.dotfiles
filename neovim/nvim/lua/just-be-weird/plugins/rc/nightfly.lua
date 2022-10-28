vim.g.nigthflyTransparent = true
vim.g.nigthflyTransparentSidebar = true
vim.g.nightflyNormalFloat = true

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single"
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
    border = "single"
})
vim.diagnostic.config({
    float = {
        border = "single"
    }
})

-- local winhighlight = {
--     winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel"
-- }
-- require('cmp').setup({
--     window = {
--         completion = cmp.config.window.bordered(winhighlight),
--         documentation = cmp.config.window.bordered(winhighlight)
--     }
-- })
--- Lua initialization file
vim.opt.fillchars = {
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋'
}

vim.cmd [[colorscheme nightfly]]