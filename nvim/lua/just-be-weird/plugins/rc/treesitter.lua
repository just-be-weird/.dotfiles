-- import nvim-treesitter plugin safely
local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then
    return
end

ts.setup {
    -- enable syntax highlighting
    highlight = {
        enable = true,
        disable = {}
    },
    -- enable indentation
    indent = {
        enable = true,
        disable = {}
    },
    ensure_installed = {'bash', 'tsx', 'toml', 'rust', 'json', 'yaml', 'javascript', 'typescript', 'tsx', 'css',
                        'graphql', 'html', 'lua', 'markdown', 'dockerfile', 'gitignore'},
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = {
        enable = true
    },
    -- auto install above language parsers
    auto_install = true
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = {'javascript', 'typescript.tsx'}
