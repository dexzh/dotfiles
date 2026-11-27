return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
        multiwindow = true,
        max_lines = 2,
        trim_scope = "inner",
    },
    keys = {
        { "<leader>c", mode = { "n", "x" }, "<cmd>TSContext toggle<cr>", desc = "toggle treesitter-context" },
        { "[c", "<cmd>TSContext go_to_context<cr>", desc = "goto context" },
    },
}
