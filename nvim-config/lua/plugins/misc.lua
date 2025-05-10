-- Standalone plugins with less than 10 lines of config go here
return {
    {
        -- Tmux & split window navigation
        -- obviously not happening in windows
        'christoomey/vim-tmux-navigator',
    },
    {
        -- Detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },
    {
        -- Powerful Git integration for Vim
        'tpope/vim-fugitive',
    },
    {
        -- GitHub integration for vim-fugitive
        'tpope/vim-rhubarb',
    },
    {
        -- Hints keybinds
        'folke/which-key.nvim',
    },
    {
        -- Autoclose parentheses, brackets, quotes, etc.
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {},
    },
    {
        -- Highlight todo, notes, etc in comments
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        -- High-performance color highlighter
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'lervag/vimtex',
        ft = 'tex',
        config = function()
            -- vim.g.vimtex_view_method = 'zathura' -- or 'skim', 'sioyek', etc. depending on your OS
            vim.g.vimtex_compiler_method = 'tectonic'
        end,
    },
}
