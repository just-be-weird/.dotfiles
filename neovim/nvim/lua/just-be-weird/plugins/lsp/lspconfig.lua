-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local keymap = vim.keymap.set -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    -- set keybinds
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    keymap('n', '<leader>td', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

    keymap('n', '<leader>f', '<Cmd>function()vim.lsp.buf.format {async = true}end<CR>', opts)

    keymap('n', '<leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

    keymap('n', '<leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

    keymap('n', '<leader>wl', '<Cmd>lua function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))end<CR>',
        opts)

    if client.name == 'tsserver' then
        keymap('n', '<leader>rf', ':TypescriptRenameFile<CR>') -- rename file and update imports
        keymap('n', '<leader>oi', ':TypescriptOrganizeImports<CR>') -- organize imports
        keymap('n', '<leader>ru', ':TypescriptRemoveUnused<CR>') -- remove unused variables
    end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' '
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ""
    })
end

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure typescript server with plugin
typescript.setup({
    server = {
        capabilities = capabilities,
        filetypes = {'typescript', 'typescriptreact', 'typescript.tsx'},
        cmd = {'typescript-language-server', '--stdio'},
        on_attach = on_attach
    }
})

lspconfig['flow'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- configure css server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
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
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                },
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
})

lspconfig.sourcekit.setup {
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

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = 'always' -- Or 'if_many'
    }
})
