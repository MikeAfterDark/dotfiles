local lush = require 'lush'
local hsl = lush.hsl

-- Disable background for editing
vim.g.theme_disable_background = true

---@diagnostic disable: undefined-global
local theme = lush(function()
    return {
        Normal { bg = 'NONE', fg = hsl(210, 10, 85) },
        CursorLine { bg = hsl(220, 20, 20) },
        Visual { fg = hsl(220, 20, 10), bg = hsl(40, 100, 50) },
        Comment { fg = hsl(120, 20, 60), gui = 'italic' },
        CursorColumn { CursorLine },
        LineNr { fg = hsl(200, 20, 50) },
        LineNrBelow { LineNr },
        LineNrAbove { LineNr },
        CursorLineNr { LineNr, fg = hsl(30, 100, 70) },
        search_base { bg = hsl(52, 80, 30), fg = hsl(52, 10, 90) },
        Search { search_base },
        IncSearch { bg = hsl(0, 80, 50), fg = hsl(60, 90, 90) },
        Error { fg = hsl(0, 80, 70), bg = hsl(0, 50, 20), gui = 'bold' },
        Warning { fg = hsl(39, 80, 70), bg = hsl(39, 50, 20), gui = 'bold' },
        Info { fg = hsl(210, 80, 70), bg = hsl(210, 50, 20), gui = 'bold' },
        Hint { fg = hsl(120, 80, 70), bg = hsl(120, 50, 20), gui = 'bold' },

        -- Syntax highlighting
        Identifier { fg = hsl(220, 80, 75) }, -- Variables
        Function { fg = hsl(240, 70, 70) }, -- Functions
        String { fg = hsl(100, 70, 70) }, -- Strings
        Keyword { fg = hsl(10, 90, 70), gui = 'bold' }, -- Keywords
        Type { fg = hsl(200, 70, 70) }, -- Types
        Constant { fg = hsl(350, 70, 70) }, -- Constants
        Statement { fg = hsl(30, 80, 70), gui = 'bold' }, -- Statements

        -- Telescope highlighting
        TelescopeNormal { fg = hsl(210, 10, 85), bg = hsl(0, 0, 0) },
        TelescopeBorder { fg = hsl(200, 20, 50), bg = hsl(0, 0, 0) },
        TelescopeSelection { fg = hsl(60, 90, 80), bg = hsl(220, 20, 30), gui = 'bold' },
        TelescopeMatching { fg = hsl(39, 100, 70), gui = 'bold' },
        TelescopePromptPrefix { fg = hsl(10, 90, 70) },
        TelescopePreviewTitle { fg = hsl(100, 80, 70), bg = hsl(100, 50, 20), gui = 'bold' },
        TelescopePromptTitle { fg = hsl(200, 80, 70), bg = hsl(200, 50, 20), gui = 'bold' },
        TelescopeResultsTitle { fg = hsl(280, 70, 70), bg = hsl(280, 50, 20), gui = 'bold' },
        TelescopePromptNormal { bg = hsl(0, 0, 0) },
        TelescopeResultsNormal { bg = hsl(0, 0, 0) },
        TelescopePreviewNormal { bg = hsl(0, 0, 0) },
    }
end)

return theme
