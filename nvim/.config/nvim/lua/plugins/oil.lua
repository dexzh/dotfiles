return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name)
                return name == ".."
            end,
        },
        cleanup_delay_ms = 0,
        use_default_keymaps = false,
        keymaps = {
            ["<cr>"] = "actions.select",
            ["-"] = "actions.parent",
            ["<c-p>"] = "actions.preview",
            ["<c-c>"] = "actions.close",
            ["g."] = "actions.toggle_hidden",
            ["gr"] = "actions.refresh",
        },
    },
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Oil" },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
