-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

-- import telescope actions safely
local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
    return
end

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require"telescope".extensions.file_browser.actions

-- configure telescope
telescope.setup({
    -- configure custom mappings
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist -- send selected to quickfixlist
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            dir_icon = "",
            -- dir_icon_hl = "Row",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

vim.keymap.set('n', ';f', function()
    builtin.find_files({
        no_ignore = false,
        hidden = true
    })
end)
vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
    builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
    builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
    builtin.resume()
end)
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = true,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {
            height = 40
        }
    })
end)
