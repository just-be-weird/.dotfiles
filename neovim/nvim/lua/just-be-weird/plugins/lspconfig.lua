-- vim.lsp.set_log_level('debug')
local status, nvim_lsp = pcall(require, 'lspconfig')

if (not status) then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp-nvim-lsp')
if not cmp_nvim_lsp_status then
    return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
    return
end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup('Format', {
    clear = true
})
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({
        group = augroup_format,
        buffer = bufnr
    })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({
                bufnr = bufnr
            })
        end
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>td', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

    buf_set_keymap('n', '<leader>f', '<Cmd>function()vim.lsp.buf.format {async = true}end<CR>', opts)

    buf_set_keymap('n', '<leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

    buf_set_keymap('n', '<leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

    buf_set_keymap('n', '<leader>wl',
        '<Cmd>lua function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))end<CR>', opts)

    if client.name == 'tsserver' then
        buf_set_keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>') -- rename file and update imports
        buf_set_keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<CR>') -- organize imports (not in youtube nvim video)
        buf_set_keymap.set('n', '<leader>ru', ':TypescriptRemoveUnused<CR>') -- remove unused variables (not in youtube nvim video)
    end
end

protocol.CompletionItemKind = {'', -- Text
'', -- Method
'', -- Function
'', -- Constructor
'', -- Field
'', -- Variable
'ﴯ', -- Class
'', -- Interface
'', -- Module
'ﰠ', -- Property
'', -- Unit
'', -- Value
'', -- Enum
'', -- Keyword
'﬌', -- Snippet
'', -- Color
'', -- File
'', -- Reference
'', -- Folder
'', -- EnumMember
'', -- Constant
'פּ', -- Struct
'', -- Event
'', -- Operator
'' -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = cmp_nvim_lsp.default_capabilities()

nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- TypeScript config
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {'typescript', 'typescriptreact', 'typescript.tsx'},
    cmd = {'typescript-language-server', '--stdio'},
    capabilities = capabilities
}

nvim_lsp.sourcekit.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Lua config
nvim_lsp.sumneko_lua.setup {
    settings = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    -- library = vim.api.nvim_get_runtime_file('', true),
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                    checkThirdParty = false
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false
                }

            }
        }
    }
}

nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 2,
        prefix = '●'
    },
    severity_sort = true
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' '
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ''
    })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = 'always' -- Or 'if_many'
    }
})

