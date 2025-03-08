return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'jayp0521/mason-null-ls.nvim', -- Ensure dependencies are installed
    },
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting   -- Formatters
        local diagnostics = null_ls.builtins.diagnostics -- Linters

        -- Formatters & linters for mason to install
        require('mason-null-ls').setup {
            ensure_installed = {
                'prettier',           -- ts/js formatter
                'stylua',             -- lua formatter
                'eslint_d',           -- ts/js linter
                'shfmt',              -- Shell formatter
                -- 'checkmake',          -- linter for Makefiles
                'ruff',               -- Python linter and formatter
                'clang_format',       -- C, C++
                'csharpier',          -- C#
                'google-java-format', -- Java
                -- 'rustfmt',            -- Rust
                'gofmt',
                'golines', -- Go
            },
            automatic_installation = true,
        }

        local sources = {
            formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
            formatting.stylua,
            formatting.shfmt.with { args = { '-i', '4' } },
            formatting.terraform_fmt,
            require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
            require 'none-ls.formatting.ruff_format',

            -- C#: csharpier
            formatting.csharpier,

            -- Java: google-java-format
            formatting.google_java_format,

            -- Rust: rustfmt
            -- formatting.rustfmt.with {
            --   extra_args = { '--edition=2021' }, -- Ensure Rust 2021 edition formatting
            -- },

            -- Go: gofmt + golines (for better formatting)
            formatting.gofmt,
            formatting.golines.with {
                extra_args = { '--max-len=100', '--base-formatter=gofmt' },
            },
        }

        -- Auto-format on save
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        null_ls.setup {
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method 'textDocument/formatting' then
                    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format { async = false }
                        end,
                    })
                end
            end,
        }
    end,
}
