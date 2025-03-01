return {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
        local comment = require 'Comment.api'
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<Leader>/', comment.toggle.linewise.current, opts)
        vim.keymap.set('v', '<Leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    end,
}
