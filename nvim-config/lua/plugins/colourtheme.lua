return {
    {
        'tiagovla/tokyodark.nvim',
        opts = {
            transparent_background = true,
            gamma = 1.10,
            styles = {
                comments = { italic = true },
                keywords = {},
                identifiers = { bold = true },
                functions = { underline = true, italic = true },
                variables = { italic = true, bold = true },
            },
            custom_highlights = function(highlights, palette)
                return highlights
            end,
            custom_palette = function(palette)
                return palette
            end,
            terminal_colors = true,
        },
        config = function(_, opts)
            require('tokyodark').setup(opts)
            vim.cmd [[colorscheme tokyodark]]
        end,
    },
}

-- return {
--     {
--         'tjdevries/colorbuddy.vim',
--         lazy = false,
--         priority = 1000,
--     },
--     {
--         'bkegley/gloombuddy',
--         lazy = false,
--         priority = 1000,
--         config = function()
--             -- Set the colorscheme to gloombuddy
--             require('colorbuddy').colorscheme 'gloombuddy'
--
--             -- Set the transparent background if desired
--             vim.cmd [[
--                 highlight Normal guibg=NONE
--                 highlight NonText guibg=NONE
--                 highlight VertSplit guibg=NONE
--                 highlight StatusLine guibg=NONE
--                 highlight StatusLineNC guibg=NONE
--                 highlight LineNr guibg=NONE
--                 highlight CursorLineNr guibg=NONE
--             ]]
--         end,
--     },
-- }

-- return { -- 6/10, too much contrast lol
--     {
--         'sekke276/dark_flat.nvim',
--         lazy = false,
--         priority = 1000,
--         config = function()
--             -- Set up the colorscheme with the desired options
--             require('dark_flat').setup {
--                 transparent = true,
--                 italics = true,
--             }
--             -- Set the colorscheme
--             vim.cmd.colorscheme 'dark_flat'
--         end,
--     },
-- }

-- return { -- 8/10, needs more contrast
--     {
--         'cpea2506/one_monokai.nvim',
--         lazy = false,
--         priority = 1000,
--         config = function()
--             require('one_monokai').setup {
--                 transparent = true,
--             }
--             vim.cmd.colorscheme 'one_monokai'
--         end,
--     },
-- }

-- return {
--     {
--         'glepnir/zephyr-nvim',
--         lazy = false, -- make sure we load this during startup if it is your main colorscheme
--         priority = 1000, -- make sure to load this before all the other start plugins
--         config = function()
--             vim.cmd [[
--                 colorscheme zephyr
--                 highlight Normal guibg=NONE ctermbg=NONE
--                 highlight NonText guibg=NONE ctermbg=NONE
--                 highlight LineNr guibg=NONE ctermbg=NONE
--             ]]
--         end,
--     },
-- }

-- return {
--     {
--         'Tsuzat/NeoSolarized.nvim',
--         lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--         priority = 1000, -- make sure to load this before all the other start plugins
--         config = function()
--             vim.cmd [[ colorscheme NeoSolarized ]]
--         end,
--     },
-- }

-- return {
--     {
--         'olimorris/onedarkpro.nvim',
--         priority = 1000,
--         config = function()
--             require('onedarkpro').setup {
--                 options = {
--                     transparency = true,
--                     terminal_colors = true,
--                     highlight_inactive_windows = false,
--                 },
--             }
--
--             -- Apply the theme
--             vim.cmd.colorscheme 'onedark_dark'
--         end,
--     },
-- }

-- return {
--     {
--         'bluz71/vim-moonfly-colors',
--         name = 'moonfly',
--         lazy = false, -- Load immediately
--         priority = 1000, -- Load before other plugins
--         config = function()
--             vim.cmd.colorscheme 'moonfly' -- Set the colorscheme
--         end,
--     },
-- }

-- return {
--     {
--         'nuvic/flexoki-nvim',
--         name = 'flexoki',
--         lazy = false, -- Load immediately
--         priority = 1000, -- Ensure it loads before other plugins
--         config = function()
--             vim.cmd.colorscheme 'flexoki' -- Set the colorscheme
--         end,
--     },
-- }

-- return { 'rktjmp/lush.nvim',} -- pairs with /lua/colours/lush.lua, not configured

-- return {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.g.nord_constrast = true
--         vim.g.nord_borders = false
--         vim.g.nord_disable_background = true
--         vim.g.nord_italic = false
--         vim.g.nord_uniform_diff_background = true
--         vim.g.nord_bold = false
--
--         -- load colorscheme
--         require('nord').set()
--
--         -- toggle transparency
--         local bg_transparent = true
--         local toggle_transparency = function()
--             bg_transparent = not bg_transparent
--             vim.g.nord_disable_background = bg_transparent
--             vim.cmd [[colorscheme nord]]
--         end
--
--         vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end
-- }
