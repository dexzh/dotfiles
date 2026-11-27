return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
        transparent = true,
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        overrides = function(colors)
            local theme = colors.theme
            local makeDiagnosticColor = function(color)
                local c = require("kanagawa.lib.color")
                return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
            end

            return {
                TelescopeBorder = { bg = "none" },
                Pmenu = { bg = theme.ui.bg_p1, fg = theme.ui.shade0 },
                PmenuSel = { bg = theme.ui.bg_p2, fg = "none" },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
                DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
                DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
                DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
                WinSeparator = { fg = theme.ui.float.fg_border },
                IblIndent = { fg = theme.ui.bg_p1 },
                DiagnosticUnnecessary = {},
                ["@string.special.url"] = { undercurl = false },
                ["@lsp.type.const"] = { link = "@lsp" },
                ["@lsp.type.namespace"] = { link = "@lsp" },
                ["@lsp.typemod.namespace.library"] = { link = "@module" },
                ["@lsp.type.enumMember"] = {},
                ["@lsp.type.keyword"] = {},
                ["@lsp.type.struct"] = {},
                ["@lsp.type.macro"] = { link = "@lsp" },
                ["@lsp.typemod.variable.global.lua"] = { link = "@lsp" },
                ["@lsp.mod.injected"] = { link = "Comment" },
                ["@lsp.typemod.variable.injected"] = { link = "@lsp" },
            }
        end,
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd.colorscheme("kanagawa")
    end,
}
