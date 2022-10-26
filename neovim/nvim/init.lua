-------------------------------------------------------------------------------
--     _ _             
--   (_) |____      __          This config is targeted for NeoVim NVIM v0.8.0
--   | | '_ \ \ /\ / /          NVIM v0.8.0-1210-gd367ed9b2
--   | | |_) \ V  V /           You may need to setup few things after cloning
--  _/ |_.__/ \_/\_/            Run :checkhealth for more info
-- |__/                         Version: 25.10.22.jbw-l.0
-------------------------------------------------------------------------------

require('just-be-weird.base')
require('just-be-weird.highlights')
require('just-be-weird.keymap')
require('just-be-weird.plugins')
require('just-be-weird.vars')             -- Variables

local has = vim.fn.has
local is_linux = has "linux"
local is_mac = has "macunix"
local is_win = has "win32"

if is_linux then
  require('just-be-weird.linuxos')
end
if is_mac then
  require('just-be-weird.macos')
end
if is_win then
  require('just-be-weird.windows')
end
