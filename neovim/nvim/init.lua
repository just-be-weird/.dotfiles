-------------------------------------------------------------------------------
--     _ _             
--   (_) |____      __          This config is targeted for NeoVim NVIM v0.8.0
--   | | '_ \ \ /\ / /          NVIM v0.8.0-1210-gd367ed9b2
--   | | |_) \ V  V /           You may need to setup few things after cloning
--  _/ |_.__/ \_/\_/            Run :checkhealth for more info
-- |__/                         Version: 25.10.22.jbw-l.0
-------------------------------------------------------------------------------

require('just-be-weird.plugins-setup') -- Plugins bootstrap
require('just-be-weird.core.base')
require('just-be-weird.core.colorscheme')
require('just-be-weird.core.highlights')
require('just-be-weird.core.keymaps')
require('just-be-weird.core.vars')
-- LSP init
require('just-be-weird.plugins.lsp.lspkind')
require('just-be-weird.plugins.lsp.mason')
require('just-be-weird.plugins.lsp.lspsaga')
require('just-be-weird.plugins.lsp.lspconfig')
require('just-be-weird.plugins.lsp.null-ls')

local has = vim.fn.has
local is_linux = has "linux"
local is_mac = has "macunix"
local is_win = has "win32"

-- To Sync clipboard between OS and NeoVim
if is_linux then
    require('just-be-weird.core.linuxos')
end
if is_mac then
    require('just-be-weird.core.macos')
end
if is_win then
    require('just-be-weird.core.windowsos')
end
